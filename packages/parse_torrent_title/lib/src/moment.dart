/// A minimal, `moment.js`-compatible date parser covering exactly the format
/// tokens the library's `date` transformers use.
///
/// Only the formats actually referenced by the default handlers are supported:
/// `YYYY`, `YY`, `MM`, `DD` and `MMM`, with single-space or no separators.
/// Anything else throws [UnsupportedError] so a typo cannot silently produce a
/// wrong date.
///
/// Two behaviours are reproduced from moment deliberately:
///  * out-of-range dates are *rejected* rather than rolled over
///    (`2019 02 31` is "Invalid date", not 2019-03-03);
///  * a two-digit year maps through `> 68 ? 1900 + yy : 2000 + yy`.
///
/// Note the callers always pass a value that was captured by a regular
/// expression which already constrains the shape to the format, so the scanner
/// never has to deal with genuinely ambiguous input.
library;

const String invalidDate = 'Invalid date';

const List<String> _monthNames = [
  'january',
  'february',
  'march',
  'april',
  'may',
  'june',
  'july',
  'august',
  'september',
  'october',
  'november',
  'december',
];

class _Cursor {
  _Cursor(this.input);

  final String input;
  int pos = 0;

  bool get atEnd => pos >= input.length;

  void skipSpaces() {
    while (pos < input.length && (input[pos] == ' ' || input[pos] == '\t')) {
      pos++;
    }
  }

  /// Reads [count] digits, returning `null` when fewer are available.
  String? digits(int count) {
    if (pos + count > input.length) return null;
    for (var i = 0; i < count; i++) {
      final code = input.codeUnitAt(pos + i);
      if (code < 0x30 || code > 0x39) return null;
    }
    final value = input.substring(pos, pos + count);
    pos += count;
    return value;
  }

  /// Reads one or two digits (moment's `M`/`D` tokens).
  String? oneOrTwoDigits() {
    final first = digits(1);
    if (first == null) return null;
    if (pos < input.length) {
      final next = input.codeUnitAt(pos);
      if (next >= 0x30 && next <= 0x39) {
        pos++;
        return first + input[pos - 1];
      }
    }
    return first;
  }

  /// Consumes an English ordinal suffix such as `st`, `nd`, `rd` or `th`.
  void consumeOrdinalSuffix() {
    if (pos + 2 > input.length) return;
    final pair = input.substring(pos, pos + 2).toLowerCase();
    if (pair == 'st' || pair == 'nd' || pair == 'rd' || pair == 'th') {
      pos += 2;
    }
  }

  /// Matches a month by full name or by its three-letter abbreviation.
  ///
  /// `sept` / `september` are both accepted, matching the `sept?(?:ember)?`
  /// alternative upstream's date regex allows.
  int? month() {
    final remaining = input.toLowerCase().substring(pos);
    for (var i = 0; i < _monthNames.length; i++) {
      final name = _monthNames[i];
      if (remaining.startsWith(name)) {
        pos += name.length;
        return i + 1;
      }
      // "sept" is the only four-letter abbreviation in use; it must be tried
      // before the three-letter form so "sept" is not cut short to "sep".
      if (name == 'september' && remaining.startsWith('sept')) {
        pos += 4;
        return i + 1;
      }
      final abbr = name.substring(0, 3);
      if (remaining.startsWith(abbr)) {
        pos += 3;
        return i + 1;
      }
    }
    return null;
  }
}

int _daysInMonth(int year, int month) {
  const lengths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  if (month == 2 && _isLeapYear(year)) return 29;
  return lengths[month - 1];
}

bool _isLeapYear(int year) =>
    (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;

/// Parses [input] using [format] and returns the date as `YYYY-MM-DD`, or
/// [invalidDate] when the value is not a real calendar date.
String parseWithFormat(String input, String format) {
  final yearFormat = _tokensOf(format);
  final cursor = _Cursor(input);

  int? year;
  int? month;
  int? day;

  for (final token in yearFormat) {
    cursor.skipSpaces();
    if (cursor.atEnd) return invalidDate;

    switch (token) {
      case 'YYYY':
        final raw = cursor.digits(4);
        if (raw == null) return invalidDate;
        year = int.parse(raw);
      case 'YY':
        final raw = cursor.digits(2);
        if (raw == null) return invalidDate;
        final value = int.parse(raw);
        // moment's parseTwoDigitYear
        year = value > 68 ? 1900 + value : 2000 + value;
      case 'MM':
        final raw = cursor.oneOrTwoDigits();
        if (raw == null) return invalidDate;
        month = int.parse(raw);
      case 'DD':
        final raw = cursor.oneOrTwoDigits();
        if (raw == null) return invalidDate;
        day = int.parse(raw);
        cursor.consumeOrdinalSuffix();
      case 'MMM':
        final value = cursor.month();
        if (value == null) return invalidDate;
        month = value;
      default:
        throw UnsupportedError('Unsupported date format token: $token');
    }
  }

  final y = year;
  final m = month ?? 1;
  final d = day ?? 1;

  if (m < 1 || m > 12) return invalidDate;
  if (d < 1 || d > _daysInMonth(y ?? 1970, m)) return invalidDate;
  if (y != null && y < 0) return invalidDate;

  final resolvedYear = y ?? 1970;
  final monthPart = resolvedYear < 0 ? '-' : '';
  return '$monthPart${resolvedYear.toString().padLeft(4, '0')}-'
      '${m.toString().padLeft(2, '0')}-${d.toString().padLeft(2, '0')}';
}

/// Splits a moment-style format string into its date tokens.
List<String> _tokensOf(String format) {
  final tokens = <String>[];
  var i = 0;
  while (i < format.length) {
    if (format[i] == ' ') {
      i++;
      continue;
    }
    if (format.startsWith('YYYY', i)) {
      tokens.add('YYYY');
      i += 4;
    } else if (format.startsWith('YY', i)) {
      tokens.add('YY');
      i += 2;
    } else if (format.startsWith('MMM', i)) {
      tokens.add('MMM');
      i += 3;
    } else if (format.startsWith('MM', i)) {
      tokens.add('MM');
      i += 2;
    } else if (format.startsWith('DD', i)) {
      tokens.add('DD');
      i += 2;
    } else {
      throw UnsupportedError('Unsupported date format: $format');
    }
  }
  return tokens;
}