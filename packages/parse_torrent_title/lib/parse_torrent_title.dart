/// Parse a torrent release name into structured metadata.
///
/// ```dart
/// import 'package:parse_torrent_title/parse_torrent_title.dart';
///
/// void main() {
///   final result = parse('The Godfather 1972 1080p BluRay x264-GROUP');
///   print(result['year']);       // 1972
///   print(result['resolution']); // 1080p
///   print(result['source']);     // BluRay
///   print(result['title']);      // The Godfather
/// }
/// ```
///
/// This is a Dart port of the JavaScript library
/// [parse-torrent-title](https://github.com/TheBeastLT/parse-torrent-title) and
/// reproduces its behaviour, including its quirks, so results are identical.
library;

import 'src/handlers.dart' as handlers;
import 'src/parser.dart';

export 'src/js.dart'
    show escapeLiteral, expandBackreference, jsParseInt, jsSlice, jsTruthy, matchGroup;
export 'src/moment.dart' show parseWithFormat;
export 'src/parser.dart'
    show
        CallbackHandler,
        Handler,
        HandlerCallback,
        MatchResult,
        ParseContext,
        Parser,
        ParserOptions,
        RegExpHandler,
        cleanTitle;
export 'src/transformers.dart'
    show
        Transformer,
        array,
        boolean,
        date,
        integer,
        list,
        lowercase,
        none,
        range,
        rangeUpTo,
        uniqConcat,
        uppercase,
        value,
        yearRange;

/// The shared parser backing [parse] and [addHandler], preloaded with every
/// default handler.
final Parser defaultParser = _createDefaultParser();

Parser _createDefaultParser() {
  final parser = Parser();
  handlers.addDefaults(parser);
  return parser;
}

/// Registers the full default matcher set on [parser].
///
/// Use this when building a custom [Parser] from scratch; [defaultParser] has
/// already had them applied.
void addDefaults(Parser parser) => handlers.addDefaults(parser);

/// Registers a matcher on [defaultParser].
///
/// [handlerName] is the result key, and the second argument is either a
/// [RegExp] or a [HandlerCallback]. See [Parser.addHandler] for the exact
/// argument conventions.
void addHandler(dynamic handlerName,
        [dynamic handler, dynamic transformer, dynamic options]) =>
    defaultParser.addHandler(handlerName, handler, transformer, options);

/// Parses [title] using the default handler set.
///
/// The returned map mirrors the upstream result object: a key is present only
/// when something matched, and `title` is always present.
Map<String, dynamic> parse(String title) => defaultParser.parse(title);