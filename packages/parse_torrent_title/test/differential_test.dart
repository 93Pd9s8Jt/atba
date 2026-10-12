// Differential test against the JavaScript reference implementation.
//
// Every release name in the upstream mocha suite was fed through the original
// library and the complete parse result was recorded in
// tool/dart_diff/corpus.json. This test replays the whole corpus and requires an
// identical result - every field, not just the asserted ones.
//
// Regenerate the corpus after cloning the JavaScript original with pnpm:
//   pnpm install && node tool/extract-corpus.js
import 'dart:convert';
import 'dart:io';

import 'package:parse_torrent_title/parse_torrent_title.dart';
import 'package:test/test.dart';

/// Recursively compares two JSON-ish values.
///
/// Numbers are compared numerically so an `int` here and a JavaScript double
/// there do not register as a difference.
bool _deepEquals(Object? a, Object? b) {
  if (a is num && b is num) return a == b;
  if (a is List && b is List) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (!_deepEquals(a[i], b[i])) return false;
    }
    return true;
  }
  if (a is Map && b is Map) {
    if (a.length != b.length) return false;
    for (final key in a.keys) {
      if (!b.containsKey(key)) return false;
      if (!_deepEquals(a[key], b[key])) return false;
    }
    return true;
  }
  return a == b;
}

void main() {
  final file = File('tool/dart_diff/corpus.json');
  if (!file.existsSync()) {
    throw StateError('reference corpus missing; regenerate from the JS '
        'original with: node tool/extract-corpus.js');
  }

  final entries =
      (jsonDecode(file.readAsStringSync()) as List).cast<Map<String, dynamic>>();

  test('matches the JavaScript reference on ${entries.length} inputs', () {
    final failures = <String>[];

    for (final entry in entries) {
      final input = entry['input'] as String;
      final expected = entry['result'] as Map<String, dynamic>;
      final actual = parse(input);

      if (!_deepEquals(expected, actual)) {
        failures.add('  input   : $input\n'
            '  expected: ${jsonEncode(expected)}\n'
            '  actual  : ${jsonEncode(actual)}');
      }
    }

    expect(failures, isEmpty,
        reason: '${failures.length} of ${entries.length} inputs differ from the '
            'JavaScript reference:\n${failures.take(10).join('\n')}');
  });

  test('corpus actually exercises the parser', () {
    // Guards against a silently empty or degenerate corpus.
    final fields = <String>{};
    for (final entry in entries) {
      fields.addAll((entry['result'] as Map).keys.cast<String>());
    }
    expect(fields.length, greaterThan(20));
    expect(
        entries.where((e) => (e['result'] as Map).length > 3).length,
        greaterThan(500));
  });
}