import 'js.dart';
import 'moment.dart';

/// Signature shared by every transformer.
///
/// The optional [previous] parameter mirrors the JavaScript transformers, which
/// are invoked as `transformer(input, result[name])`. Transformers that do not
/// use the previously parsed value simply ignore it.
typedef Transformer = dynamic Function(String input, [dynamic previous]);

final RegExp _nonWordRuns = RegExp(r'\W+');
final RegExp _nonDigitRuns = RegExp(r'\D+');
final RegExp _digitRuns = RegExp(r'\d+');
final RegExp _rangeSeparators = RegExp(r'^\d+[ .]*[,&+][ .]*\d+$');

/// Returns the matched text unchanged.
dynamic none(String input, [dynamic previous]) => input;

/// Produces a constant value, substituting `$1` (when present) with [input].
///
/// This is how fixed values such as `"4k"` or `"$1p"` are declared.
Transformer value(Object? constant) => (String input, [dynamic previous]) {
      if (constant is String) return constant.replaceFirst(r'$1', input);
      return constant;
    };

/// Parses a leading integer, ignoring trailing junk (`"1080p"` -> `1080`).
dynamic integer(String input, [dynamic previous]) => jsParseInt(input);

/// Always `true`; the presence of the match is the signal.
dynamic boolean(String input, [dynamic previous]) => true;

dynamic lowercase(String input, [dynamic previous]) => input.toLowerCase();

dynamic uppercase(String input, [dynamic previous]) => input.toUpperCase();

/// Parses a date with the given moment-style [dateFormat].
Transformer date(String dateFormat) => (String input, [dynamic previous]) {
      // moment() is fed a sanitised string: runs of non-word characters are
      // collapsed to single spaces, so "2019.10.25" and "2019-10-25" both
      // arrive as "2019 10 25".
      final sanitized = input.replaceAll(_nonWordRuns, ' ').trim();
      return parseWithFormat(sanitized, dateFormat);
    };

/// Expands a numeric range: `"1-3"` becomes `[1, 2, 3]`.
///
/// Returns `null` when the values are neither ascending nor consecutive, which
/// tells the parser that another handler should get a chance.
dynamic range(String input, [dynamic previous]) {
  var values = input
      .replaceAll(_nonDigitRuns, ' ')
      .trim()
      .split(' ')
      .map((part) => jsParseInt(part) ?? 0)
      .toList();

  // A two-value range is expanded into every value it spans, unless the input
  // used an explicit list separator such as "1,3" or "1 & 3".
  if (values.length == 2 &&
      values[0] < values[1] &&
      !_rangeSeparators.hasMatch(input.trim())) {
    values = List<int>.generate(
        values[1] - values[0] + 1, (index) => values[0] + index);
  }

  final ascending = values.asMap().entries.every((entry) =>
      entry.key == values.length - 1 || entry.value + 1 == values[entry.key + 1]);
  if (!ascending) return null;

  return values;
}

/// Collects every distinct integer in the input, sorted ascending.
dynamic list(String input, [dynamic previous]) {
  final numbers = <int>{};
  for (final match in _digitRuns.allMatches(input)) {
    final parsed = jsParseInt(match.group(0)!);
    if (parsed != null) numbers.add(parsed);
  }
  return numbers.toList()..sort();
}

/// Expands `N` into `[1, 2, ..., N]`.
dynamic rangeUpTo(String input, [dynamic previous]) {
  final end = jsParseInt(input) ?? 0;
  if (end <= 0) return null;
  return List<int>.generate(end, (index) => index + 1);
}

/// Parses a year range such as `"2010-2012"` into `"2010-2012"`, or a lone
/// year into an `int`. Two-digit end years are expanded against the start
/// year (`"2010-12"` -> `"2010-2012"`).
dynamic yearRange(String input, [dynamic previous]) {
  final parts = input.split(_nonDigitRuns);
  final start = parts.isNotEmpty ? jsParseInt(parts[0]) : null;
  var end = parts.length > 1 ? jsParseInt(parts[1]) : null;

  if (end == null) return start;
  if (start == null) return null;

  if (end < 100) {
    end = end + start - start % 100;
  }
  if (end <= start) return null; // not a year range; let another handler try
  return '$start-$end';
}

/// Wraps [chain] so its result becomes a single-element list.
Transformer array(Transformer? chain) => (String input, [dynamic previous]) =>
    [chain == null ? input : chain(input)];

/// Appends [chain]'s result to the list parsed so far, without duplicates.
Transformer uniqConcat(Transformer chain) => (String input, [dynamic previous]) {
      final existing = previous is List ? previous : <dynamic>[];
      final produced = chain(input);
      return existing.contains(produced) ? existing : [...existing, produced];
    };