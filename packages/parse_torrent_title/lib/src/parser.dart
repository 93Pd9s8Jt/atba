import 'js.dart';
import 'transformers.dart';

// Character ranges are written with `\uHHHH` escapes in ordinary strings.
// Dart resolves them at compile time exactly as JavaScript does, and keeping
// the source pure ASCII means no editor or shell round-trip can silently
// corrupt a range.
//
// chinese/japanese/russian chars, as used by the title-cleaning regexes
const String _nonEnglishChars =
  '\u3040-\u30FF\u3400-\u4DBF\u4E00-\u9FFF'
  '\uF900-\uFAFF\uFF66-\uFF9F\u0400-\u04FF';

/// Opening release-group marking: the class is `[`, U+3010 and U+2605.
const String _openMark = '[[\u3010\u2605]';

/// Closing counterpart of [_openMark]: `]`, U+3011 and U+2605.
const String _closeMark = '[\\]\u3011\u2605]';

/// Cyrillic only - used by the "russian cast" removal.
const String _cyrillic = '\u0400-\u04FF';

final RegExp _russianCast = RegExp(r'\([^)]*['
    '$_cyrillic'
    r'][^)]*\)$|(?<=/.*)\(.*\)$');

final RegExp _altTitles = RegExp('[^/|(]*[$_nonEnglishChars][^/|]*[/|]|'
    '[/|][^/|(]*[$_nonEnglishChars][^/|]*');

// Every occurrence of the range must sit inside a character class; used bare it
// would be a literal sequence of characters and hyphens.
final RegExp _notOnlyNonEnglish = RegExp(
    '(?<=[a-zA-Z][^$_nonEnglishChars]+)[$_nonEnglishChars].*[$_nonEnglishChars]|'
    '[$_nonEnglishChars].*[$_nonEnglishChars](?=[^$_nonEnglishChars]+[a-zA-Z])');

final RegExp _notAllowedAtStartAndEnd =
    RegExp('^[^\\w$_nonEnglishChars#$_openMark+|[ \\-:,/\\\\\\[|{(#\$&^]+\$');

final RegExp _remainingNotAllowedAtStartAndEnd =
    RegExp('^[^\\w$_nonEnglishChars#]+|[\\[\\]({} ]+\$');

final RegExp _unclosedBracketAtEnd = RegExp(r'\s*[([{][^)\]}]*$');
final RegExp _unopenedBracket = RegExp(r'^([^([{]*)[)\]}]');

/// Tunables for a single matcher, mirroring upstream's `ParserOptions`.
class ParserOptions {
  const ParserOptions({
    this.skipIfAlreadyFound = true,
    this.skipFromTitle = false,
    this.skipIfFirst = false,
    this.skipIfBefore = const [],
    this.remove = false,
  });

  /// Skip this matcher if another matcher of the same group already matched.
  final bool skipIfAlreadyFound;

  /// Exclude the matched text from the returned title.
  final bool skipFromTitle;

  /// Skip this matcher when nothing else matched before its position.
  final bool skipIfFirst;

  /// Skip this matcher when it appears before any of these groups.
  final List<String> skipIfBefore;

  /// Strip the matched text before running subsequent matchers.
  final bool remove;

  static ParserOptions from(Object? value) {
    if (value is ParserOptions) return value;
    if (value == null) return const ParserOptions();
    throw ArgumentError(
        'Options must be a ParserOptions, got ${value.runtimeType}');
  }
}

/// What a handler reports back to the parser after inspecting the title.
class MatchResult {
  const MatchResult({
    this.rawMatch,
    this.matchIndex,
    this.remove = false,
    this.skipFromTitle = false,
  });

  /// The matched substring, used when [remove] is set.
  final String? rawMatch;

  /// Index the match started at. A `null` (or `0`) index means "unknown",
  /// which is treated as falsy exactly as JavaScript would.
  final int? matchIndex;

  final bool remove;
  final bool skipFromTitle;
}

/// Mutable state handed to every handler during a single [Parser.parse] call.
class ParseContext {
  ParseContext(this.title, this.result, this.matched);

  String title;
  final Map<String, dynamic> result;

  /// Records, per handler group, the first match seen: its raw text and index.
  final Map<String, Map<String, dynamic>> matched;
}

/// Index recorded for a handler group, or `null` when it has not matched.
///
/// The recorded value is untyped because it mirrors the JavaScript object the
/// upstream parser carries around; this keeps the comparisons type-safe.
int? matchIndexOf(Map<String, dynamic>? entry) {
  final value = entry?['matchIndex'];
  return value is int ? value : null;
}

/// A user-supplied matcher function.
typedef HandlerCallback = dynamic Function(ParseContext context);

/// Base class for matchers. Upstream attaches a `handlerName` property to plain
/// functions; a class carries that metadata more naturally in Dart.
abstract class Handler {
  Handler(this.handlerName);

  final String handlerName;

  /// Inspects (and possibly mutates) [context], returning what the parser
  /// should do with the match.
  MatchResult? call(ParseContext context);
}

final RegExp _beforeTitle = RegExp(r'^\[[^[\]]+]');

/// A matcher built from a regular expression plus an optional transformer.
class RegExpHandler extends Handler {
  RegExpHandler(super.handlerName, this.pattern, this.transformer, this.options);

  final RegExp pattern;
  final Transformer transformer;
  final ParserOptions options;

  @override
  MatchResult? call(ParseContext context) {
    final title = context.title;
    final result = context.result;
    final matched = context.matched;

    if (jsTruthy(result[handlerName]) && options.skipIfAlreadyFound) {
      return null;
    }

    final match = pattern.firstMatch(title);
    if (match == null) return null;

    final rawMatch = match.group(0)!;
    // Upstream keeps the first capture group when present, falling back to the
    // whole match — and treats an empty capture as absent.
    final capture = matchGroup(match, 1);
    final cleanMatch = jsTruthy(capture) ? capture! : rawMatch;

    final transformed = transformer(cleanMatch, result[handlerName]);
    if (!jsTruthy(transformed)) return null;

    final matchIndex = match.start;

    final beforeTitleMatch = _beforeTitle.firstMatch(title);
    final isBeforeTitle =
        beforeTitleMatch != null && matchIndex < beforeTitleMatch.group(0)!.length;

    final otherMatches =
        matched.entries.where((entry) => entry.key != handlerName).toList();

    final isSkipIfFirst = options.skipIfFirst &&
        otherMatches.isNotEmpty &&
        otherMatches.every((entry) {
          final other = matchIndexOf(entry.value);
          return other != null && matchIndex < other;
        });

    final isSkipIfBefore = options.skipIfBefore.any((group) {
      final other = matchIndexOf(matched[group]);
      return other != null && matchIndex < other;
    });

    if (isSkipIfFirst || isSkipIfBefore) return null;

    matched.putIfAbsent(handlerName, () => <String, dynamic>{
      'rawMatch': rawMatch,
      'matchIndex': matchIndex,
    });

    result[handlerName] = transformed;

    return MatchResult(
      rawMatch: rawMatch,
      matchIndex: matchIndex,
      remove: options.remove,
      skipFromTitle: isBeforeTitle || options.skipFromTitle,
    );
  }
}

/// A matcher written by hand in Dart.
class CallbackHandler extends Handler {
  CallbackHandler(super.handlerName, this.callback);

  final HandlerCallback callback;

  /// A handler may return `null`, a [MatchResult], or a plain map in the shape
  /// upstream's object literals used; [_asMatchResult] normalises all three.
  @override
  MatchResult? call(ParseContext context) => _asMatchResult(callback(context));
}

/// Normalises a handler's return value into a [MatchResult].
MatchResult? _asMatchResult(dynamic value) {
  if (value == null) return null;
  if (value is MatchResult) return value;
  if (value is Map) {
    return MatchResult(
      rawMatch: value['rawMatch'] as String?,
      matchIndex: value['matchIndex'] as int?,
      remove: jsTruthy(value['remove']),
      skipFromTitle: jsTruthy(value['skipFromTitle']),
    );
  }
  return null;
}

/// Replaces the first match, substituting capture group 1 for the whole match.
///
/// Dart's `String.replaceFirst` does **not** interpret `$1` in the replacement
/// string (JavaScript's `String.replace` does), so group references have to be
/// resolved explicitly.
String _replaceWithGroup1(RegExp pattern, String input) =>
    input.replaceFirstMapped(pattern, (match) => matchGroup(match, 1) ?? '');

/// Strips release noise (markings, alt-language titles, stray punctuation)
/// from the part of the title that no matcher consumed.
String cleanTitle(String rawTitle) {
  var cleaned = rawTitle;

  if (!cleaned.contains(' ') && cleaned.contains('.')) {
    cleaned = cleaned.replaceAll('.', ' ');
  }

  cleaned = cleaned
      .replaceAll('_', ' ')
      .replaceFirst(RegExp(r'[[(]movie[)\]]', caseSensitive: false), '')
      .replaceAll(_notAllowedAtStartAndEnd, '')
      .replaceFirst(_russianCast, '');

  // Remove a release-group marking section from the start ...
  cleaned = _replaceWithGroup1(
      RegExp('^$_openMark.*$_closeMark[ .]?(.+)'), cleaned);

  // ... and an unneeded one at the end.
  cleaned =
      _replaceWithGroup1(RegExp('(.+)[ .]?$_openMark.*$_closeMark\$'), cleaned);

  cleaned = cleaned
      .replaceAll(_altTitles, '')
      .replaceAll(_notOnlyNonEnglish, '')
      .replaceAll(_remainingNotAllowedAtStartAndEnd, '')
      // A dot-separated title gets its dots turned into spaces.
      .replaceFirstMapped(
          RegExp(r'^[^\s.]*\.\S*$'), (m) => m.group(0)!.replaceAll('.', ' '))
      .replaceFirst(_unclosedBracketAtEnd, '');

  cleaned = _replaceWithGroup1(_unopenedBracket, cleaned);

  return cleaned.replaceAll(RegExp(r'\s+'), ' ').trim();
}

/// Applies an ordered list of matchers to a torrent release name.
class Parser {
  Parser([List<Handler>? handlers])
      : _handlers = <Handler>[...?handlers];

  final List<Handler> _handlers;

  /// The registered matchers, in the order they run.
  List<Handler> get handlers => List.unmodifiable(_handlers);

  /// Registers a matcher.
  ///
  /// Mirrors the upstream overloads:
  ///   * `addHandler(fn)` — an anonymous function matcher;
  ///   * `addHandler(name, fn)` — a named function matcher;
  ///   * `addHandler(name, regexp, [transformer], [options])` — a regex matcher.
  ///
  /// Note: upstream assigns `transformer = none` *before* testing whether the
  /// third argument is an options object, so options passed in that position
  /// are silently discarded. That behaviour is reproduced here so the port
  /// stays compatible; pass a transformer explicitly to supply options.
  void addHandler(dynamic handlerName,
      [dynamic handler, dynamic transformer, dynamic options]) {
    Handler resolved;

    if (handler == null && handlerName is HandlerCallback) {
      resolved = CallbackHandler('unknown', handlerName);
    } else if (handlerName is String && handler is RegExp) {
      final effectiveTransformer =
          transformer is Function ? transformer as Transformer : none;
      // Intentionally mirrors upstream: the object check runs *after* the
      // fallback assignment above, so an options object in the transformer slot
      // never reaches here.
      final effectiveOptions = ParserOptions.from(
          effectiveTransformer is ParserOptions
              ? effectiveTransformer
              : options);
      resolved = RegExpHandler(
          handlerName, handler, effectiveTransformer, effectiveOptions);
    } else if (handler is HandlerCallback) {
      resolved = CallbackHandler(
          handlerName is String ? handlerName : 'unknown', handler);
    } else {
      throw ArgumentError(
          'Handler for $handlerName should be a RegExp or a function. '
          'Got: ${handler.runtimeType}');
    }

    _handlers.add(resolved);
  }

  /// Runs every matcher against [title] and returns the parsed fields.
  ///
  /// The returned map mirrors the upstream result object: keys are omitted when
  /// nothing matched. `title` is always present.
  Map<String, dynamic> parse(String title) {
    var current = title.replaceAll(RegExp(r'_+'), ' ');

    final result = <String, dynamic>{};
    final matched = <String, Map<String, dynamic>>{};
    var endOfTitle = current.length;

    for (final handler in _handlers) {
      final matchResult = handler.call(ParseContext(current, result, matched));
      if (matchResult == null) continue;

      final matchIndex = matchResult.matchIndex;
      final rawMatch = matchResult.rawMatch ?? '';

      if (matchResult.remove && matchIndex != null) {
        current = jsSlice(current, 0, matchIndex) +
            jsSlice(current, matchIndex + rawMatch.length);
      }
      // A matchIndex of 0 is falsy in JavaScript, so it never narrows the title.
      // A handler that opts out of the title (skipFromTitle) must not narrow it
      // either - it only removes its own text, never what precedes it.
      if (matchIndex != null &&
          matchIndex != 0 &&
          !matchResult.skipFromTitle &&
          matchIndex < endOfTitle) {
        endOfTitle = matchIndex;
      }
      if (matchResult.remove &&
          matchResult.skipFromTitle &&
          matchIndex != null &&
          matchIndex < endOfTitle) {
        // Adjust the index when part of the title was removed and skipped.
        endOfTitle -= rawMatch.length;
      }
    }

    result['title'] = cleanTitle(jsSlice(current, 0, endOfTitle));

    return result;
  }
}
