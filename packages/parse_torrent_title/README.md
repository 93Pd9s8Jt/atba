# parse_torrent_title

A Dart port of [`parse-torrent-title`](https://github.com/TheBeastLT/parse-torrent-title),
the JavaScript library that extracts structured metadata from a torrent release
name. Fully ported with AI, so don't rely too much on correctness.

```dart
import 'package:parse_torrent_title/parse_torrent_title.dart';

void main() {
  final result = parse('The Godfather 1972 1080p BluRay x264-GROUP');
  print(result['title']);       // The Godfather
  print(result['year']);        // 1972
  print(result['resolution']);  // 1080p
  print(result['source']);      // BluRay
  print(result['codec']);       // x264
  print(result['group']);       // GROUP
}
```

## API

### Top level

| | |
|---|---|
| `parse(String title)` | Parses a release name with the default handlers. |
| `addDefaults(Parser parser)` | Registers the full default matcher set on a parser. |
| `addHandler(name, handler, [transformer], [options])` | Registers a matcher on the default parser. |
| `defaultParser` | The shared parser, exposed for inspection. |
| `cleanTitle(String title)` | The title-cleaning pass on its own. |

### `Parser`

`Parser()` creates an empty parser; `addHandler` accepts a `RegExp` (plus an
optional `Transformer` and `ParserOptions`) or a callback, and `parse` returns a
`Map<String, dynamic>` that mirrors the upstream result object — a key is
present only when something matched, and `title` is always present.

```dart
final parser = Parser();
addDefaults(parser);

parser.addHandler(
  'edition',
  RegExp(r"\bCollector's Edition\b", caseSensitive: false),
  value('collector'),
  const ParserOptions(remove: true),
);
```

Custom handlers receive a `ParseContext` with `title`, `result` and `matched`,
and may return a `MatchResult` to influence the final title.

### Transformers

`none`, `value`, `integer`, `boolean`, `lowercase`, `uppercase`, `date`,
`range`, `rangeUpTo`, `list`, `yearRange`, `array`, `uniqConcat` — all exported.

## Layout

```
lib/
  parse_torrent_title.dart   public API
  src/
    parser.dart              matcher engine, cleanTitle, ParserOptions
    handlers.dart            the 327 default handlers
    transformers.dart        value transformers
    moment.dart              minimal moment.js-compatible date parser
    js.dart                  JavaScript semantics helpers
test/
  differential_test.dart     exhaustive equivalence with the JS reference
  api_test.dart              hand-written API, helper and quirk tests
  *_test.dart                generated from the upstream mocha suite
tool/dart_diff/              development harnesses (see above)
```


## Tests

`test/*_test.dart` are generated from the upstream mocha suites, one file per
upstream file. They assert the **complete** parse result for each release name,
which is strictly stronger than the upstream `deep.include` assertions.

## License

MIT, as with the original project.