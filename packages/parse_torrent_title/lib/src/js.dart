/// Small helpers that reproduce JavaScript semantics which differ from Dart's.
///
/// The original library is written in JavaScript and relies on several of its
/// language quirks (truthiness of empty arrays, `parseInt`'s prefix parsing,
/// loose numeric coercion). Reproducing them here keeps the port behaviourally
/// identical instead of merely similar.
library;

/// JavaScript truthiness.
///
/// `false`, `0`, `-0`, `NaN`, `""`, `null` and `undefined` are falsy; everything
/// else is truthy — **including empty collections**, which is the case that
/// actually matters here (`[]` is truthy in JS but Dart would treat a non-null
/// value the same way, so this mainly guards strings, numbers and nulls).
bool jsTruthy(Object? value) {
  if (value == null) return false;
  if (value is bool) return value;
  if (value is String) return value.isNotEmpty;
  if (value is num) return !value.isNaN && value != 0;
  return true;
}

/// Whitespace as recognised by JavaScript's `\s` and `String.prototype.trim`.
final RegExp _jsWhitespace = RegExp(
  r'^[\s﻿   -    '
  r' 　﻿]+|[\s﻿   -    '
  r' 　﻿]+$'
);

/// Equivalent of JavaScript's `parseInt(string, 10)`.
///
/// Unlike [int.tryParse] this parses a *prefix*: `"1080p"` yields `1080`.
/// Returns `null` for `NaN`.
int? jsParseInt(String input) {
  var s = input.replaceFirst(_jsWhitespace, '');
  if (s.isEmpty) return null;

  var negative = false;
  if (s.startsWith('+') || s.startsWith('-')) {
    negative = s.startsWith('-');
    s = s.substring(1);
  }

  var end = 0;
  while (end < s.length && _isDigit(s.codeUnitAt(end))) {
    end++;
  }
  if (end == 0) return null;

  final value = int.tryParse(s.substring(0, end));
  if (value == null) return null;
  return negative ? -value : value;
}

bool _isDigit(int codeUnit) => codeUnit >= 0x30 && codeUnit <= 0x39;

/// JavaScript's `String.prototype.slice`: indices are clamped and a negative
/// index counts back from the end, rather than throwing as `substring` does.
///
/// This matters throughout the parser: a `remove` handler shortens the title
/// while previously recorded indices still refer to the original string, so
/// out-of-range slices are routine rather than exceptional.
String jsSlice(String input, int start, [int? end]) {
  final length = input.length;
  final from = (start < 0 ? length + start : start).clamp(0, length);
  final to =
      end == null ? length : (end < 0 ? length + end : end).clamp(0, length);
  return to <= from ? '' : input.substring(from, to);
}

/// Expands a pattern that used a backreference to require two characters to be
/// *identical*, into an alternation over [variants].
///
/// Dart's [RegExp] has no backreference support, so a JavaScript pattern such
/// as `([. \-/\\])…\2` ("the second separator must be the same as the first")
/// cannot be evaluated directly. Repeating the whole pattern once per allowed
/// character is exactly equivalent — and, unlike substituting a character class
/// for the backreference, it still *requires the two characters to agree*.
///
/// The template marks every position governed by the backreference with `§`.
/// The expansion introduces no capturing groups of its own, so callers must
/// keep any group the transformer relies on outside the alternation.
String expandBackreference(String template, List<String> variants) {
  final expanded =
      variants.map((v) => template.replaceAll('§', escapeLiteral(v))).join('|');
  return '(?:$expanded)';
}

/// Captures group [index] of [match], or `null` when the pattern has no such
/// group.
///
/// JavaScript returns `undefined` for an out-of-range capture index, while
/// [Match.group] throws a [RangeError]. Every capture in this library is read
/// defensively, so the JS behaviour is what the port needs.
String? matchGroup(Match match, int index) =>
    index >= 0 && index <= match.groupCount ? match.group(index) : null;

/// Escapes [input] so it can be embedded literally outside a character class.
String escapeLiteral(String input) {
  final buffer = StringBuffer();
  for (final rune in input.runes) {
    switch (rune) {
      case 0x2E: // .
      case 0x2A: // *
      case 0x2B: // +
        buffer.write(r'\');
        buffer.writeCharCode(rune);
      case 0x5C: // backslash
        buffer.write(r'\\');
      case 0x5B: // [
      case 0x5D: // ]
      case 0x7B: // {
      case 0x7D: // }
      case 0x28: // (
      case 0x29: // )
      case 0x7C: // |
      case 0x5E: // ^
      case 0x24: // $
      case 0x3F: // ?
        buffer.write(r'\');
        buffer.writeCharCode(rune);
      default:
        buffer.writeCharCode(rune);
    }
  }
  return buffer.toString();
}
