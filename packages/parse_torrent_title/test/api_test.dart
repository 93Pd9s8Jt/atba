// Hand-written tests for the public API, the JS-semantics helpers, and the
// upstream quirks this port deliberately preserves.
import 'package:parse_torrent_title/parse_torrent_title.dart';
import 'package:test/test.dart';

void main() {
  group('parse', () {
    test('extracts the common fields', () {
      final result = parse('The Godfather 1972 1080p BluRay x264-GROUP');

      expect(result['title'], 'The Godfather');
      expect(result['year'], 1972);
      expect(result['resolution'], '1080p');
      expect(result['source'], 'BluRay');
      expect(result['codec'], 'x264');
      expect(result['group'], 'GROUP');
    });

    test('omits keys that did not match, as the JS result object does', () {
      final result = parse('Some Movie 2019 1080p');

      expect(result.containsKey('audio'), isFalse);
      expect(result.containsKey('dubbed'), isFalse);
      expect(result.containsKey('title'), isTrue);
    });

    test('always returns a title', () {
      expect(parse('')['title'], '');
    });
  });

  group('Parser', () {
    test('can be built from scratch with addDefaults', () {
      final parser = Parser();
      addDefaults(parser);

      expect(parser.parse('Blade Runner 1982 2160p BluRay')['year'], 1982);
    });

    test('supports a custom regex handler', () {
      final parser = Parser();
      parser.addHandler(
          'foo', RegExp(r'\bFOO\b'), value(r'$1'), const ParserOptions());

      final result = parser.parse('Some FOO Title');

      expect(result['foo'], 'FOO');
    });

    test('supports a custom function handler', () {
      final parser = Parser();
      parser.addHandler('length', (ParseContext context) {
        context.result['length'] = context.title.length;
        return null;
      });

      expect(parser.parse('abcd')['length'], 4);
    });

    test('rejects a handler that is neither a RegExp nor a function', () {
      final parser = Parser();
      expect(() => parser.addHandler('bad', 42), throwsArgumentError);
    });
  });

  group('upstream quirks preserved on purpose', () {
    // Upstream assigns `transformer = none` *before* testing whether the third
    // argument is an options object, so options given in that position are
    // silently dropped. Three default handlers pass their options this way (the
    // two MUX/DivX source handlers and the hyphenated group handler), so their
    // `remove: true` never takes effect. Honouring them would change 21 of the
    // 1243 corpus results, so this port reproduces the shipped behaviour.
    test('options in the transformer position are ignored', () {
      final parser = Parser();
      parser.addHandler('mux', RegExp(r'\bMUX\b', caseSensitive: false),
          const ParserOptions(remove: true));

      String? seenByNextHandler;
      parser.addHandler('spy', (ParseContext context) {
        seenByNextHandler = context.title;
        return null;
      });

      final result = parser.parse('A MUX B');

      expect(result['mux'], 'MUX');
      // `remove: true` was dropped, so the matched text is still present when
      // the next handler runs - exactly what the JavaScript original does.
      expect(seenByNextHandler, 'A MUX B');
    });

    test('passing the transformer explicitly does apply options', () {
      String? seenByNextHandler;
      final parser = Parser();
      parser.addHandler('mux', RegExp(r'\bMUX\b', caseSensitive: false), none,
          const ParserOptions(remove: true));
      parser.addHandler('spy', (ParseContext context) {
        seenByNextHandler = context.title;
        return null;
      });

      parser.parse('A MUX B');

      expect(seenByNextHandler, 'A  B');
    });

    test('a match at index 0 never truncates the title', () {
      // JavaScript treats 0 as falsy, so `matchIndex && ...` skips it.
      expect(parse('1080p The Movie')['title'], 'The Movie');
    });

    test('a skipFromTitle handler does not truncate the title', () {
      // `!matchResult.skipFromTitle` guards the endOfTitle update upstream, so
      // the title stays intact even though the match is excluded from it.
      final parser = Parser();
      parser.addHandler(
          'marker',
          RegExp(r'\bcollection\b', caseSensitive: false),
          (input, [previous]) => input,
          const ParserOptions(skipFromTitle: true));

      expect(parser.parse('Some Movie Collection')['title'],
          'Some Movie Collection');
    });

    test('without skipFromTitle the same match truncates the title', () {
      final parser = Parser();
      parser.addHandler(
          'marker',
          RegExp(r'\bcollection\b', caseSensitive: false),
          (input, [previous]) => input);

      expect(parser.parse('Some Movie Collection')['title'], 'Some Movie');
    });
  });

  group('JS semantics helpers', () {
    test('jsTruthy follows JavaScript, not Dart', () {
      expect(jsTruthy(null), isFalse);
      expect(jsTruthy(''), isFalse);
      expect(jsTruthy(0), isFalse);
      expect(jsTruthy(false), isFalse);
      expect(jsTruthy(double.nan), isFalse);

      // An empty list is truthy in JavaScript.
      expect(jsTruthy(<int>[]), isTrue);
      expect(jsTruthy('x'), isTrue);
    });

    test('jsParseInt parses a prefix like JavaScript', () {
      expect(jsParseInt('1080p'), 1080);
      expect(jsParseInt('  -42'), -42);
      expect(jsParseInt('12abc34'), 12);
      expect(jsParseInt('abc'), isNull);
      expect(jsParseInt(''), isNull);
      // Radix 10 means "0x10" parses as 0, not 16.
      expect(jsParseInt('0x10'), 0);
    });

    test('jsSlice clamps and counts negatives from the end', () {
      const s = 'abcdef';
      expect(jsSlice(s, 0, 99), 'abcdef');
      expect(jsSlice(s, 4), 'ef');
      expect(jsSlice(s, 0, -2), 'abcd');
      expect(jsSlice(s, 99, 100), '');
      expect(jsSlice(s, 3, 1), '');
    });

    test('expandBackreference requires the characters to agree', () {
      // Dart has no backreferences; this builds the equivalent alternation.
      final pattern = RegExp(expandBackreference(r'a§b§c', ['x', 'y']));

      expect(pattern.hasMatch('axbxc'), isTrue);
      expect(pattern.hasMatch('aybyc'), isTrue);
      // A mixed pair must NOT match, which a plain character class would allow.
      expect(pattern.hasMatch('axbyc'), isFalse);
    });
  });

  group('date parsing', () {
    test('formats supported moment tokens', () {
      expect(parseWithFormat('2019 10 25', 'YYYY MM DD'), '2019-10-25');
      expect(parseWithFormat('25 10 2019', 'DD MM YYYY'), '2019-10-25');
      expect(parseWithFormat('13 Feb 2016', 'DD MMM YYYY'), '2016-02-13');
      expect(parseWithFormat('13 FEBRUARY 2016', 'DD MMM YYYY'), '2016-02-13');
      expect(parseWithFormat('30th Sept 2020', 'DD MMM YYYY'), '2020-09-30');
      expect(parseWithFormat('20191025', 'YYYYMMDD'), '2019-10-25');
    });

    test('expands two-digit years like moment', () {
      expect(parseWithFormat('07 06 15', 'MM DD YY'), '2015-07-06');
      expect(parseWithFormat('07 06 96', 'MM DD YY'), '1996-07-06');
      // moment switches to the 1900s only above 68.
      expect(parseWithFormat('07 06 68', 'MM DD YY'), '2068-07-06');
    });

    test('rejects impossible calendar dates instead of overflowing', () {
      expect(parseWithFormat('2019 02 31', 'YYYY MM DD'), 'Invalid date');
      expect(parseWithFormat('31 04 2019', 'DD MM YYYY'), 'Invalid date');
      expect(parseWithFormat('20190231', 'YYYYMMDD'), 'Invalid date');
      // ...but real leap days are fine.
      expect(parseWithFormat('20200229', 'YYYYMMDD'), '2020-02-29');
    });

    test('rejects an unsupported format loudly', () {
      expect(() => parseWithFormat('2019', 'QQ'), throwsUnsupportedError);
    });
  });

  group('transformers', () {
    test('none passes the match through', () {
      expect(none('AbC'), 'AbC');
    });

    test(r'value substitutes $1 only when present', () {
      final substitute = value(r'$1p');
      expect(substitute('1080'), '1080p');
      expect(value('4k')('anything'), '4k');
      // A non-string constant ignores the input entirely.
      expect(value(true)('x'), isTrue);
    });

    test('integer parses a prefix', () {
      expect(integer('1080p'), 1080);
    });

    test('boolean ignores its input', () {
      expect(boolean(''), isTrue);
    });

    test('range expands consecutive spans', () {
      expect(range('1-3'), [1, 2, 3]);
      // An explicit separator is not expanded.
      expect(range('1,3'), isNull);
      expect(range('1 & 2'), [1, 2]);
    });

    test('rangeUpTo counts from one', () {
      expect(rangeUpTo('5'), [1, 2, 3, 4, 5]);
      expect(rangeUpTo('0'), isNull);
    });

    test('list collects unique sorted numbers', () {
      expect(list('E03 E01 E02 E01'), [1, 2, 3]);
    });

    test('yearRange expands a two-digit end year', () {
      expect(yearRange('2010-2012'), '2010-2012');
      expect(yearRange('2010-12'), '2010-2012');
      expect(yearRange('2010'), 2010);
      expect(yearRange('2012-2010'), isNull);
    });

    test('array wraps a value in a list', () {
      expect(array(integer)('7'), [7]);
    });

    test('uniqConcat appends without duplicates', () {
      final append = uniqConcat(value('x'));
      expect(append('x'), ['x']);
      expect(append('x', ['x']), ['x']);
      expect(append('x', ['y']), ['y', 'x']);
    });
  });

  group('cleanTitle', () {
    test('strips release-group markings at both ends', () {
      expect(cleanTitle('[Group] Some Movie'), 'Some Movie');
      expect(cleanTitle('Some Movie [Group]'), 'Some Movie');
    });

    test('replaces dots when the whole title is dot separated', () {
      expect(cleanTitle('Some.Movie.Name'), 'Some Movie Name');
    });

    test('turns underscores into spaces', () {
      expect(cleanTitle('Some_Movie'), 'Some Movie');
    });

    test('keeps a title that is itself a year', () {
      expect(cleanTitle('2019'), '2019');
    });
  });
}
