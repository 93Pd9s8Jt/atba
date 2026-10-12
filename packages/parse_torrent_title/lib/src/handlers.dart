import 'js.dart';
import 'parser.dart';
import 'transformers.dart';

const String videoExtensions =
    '3g2|3gp|avi|flv|mkv|mk3d|mov|mp2|mp4|m4v|mpe|mpeg|mpg|mpv|webm|wmv|ogm|divx|ts|m2ts';
const String subtitleExtensions = 'sub|smi|srt|ssa|ass|vtt';

/// Separators accepted by the date patterns, i.e. the character class `[. \-/\\]`
/// that the upstream `\2` backreference constrained.
const List<String> _dateSeparators = ['.', ' ', '-', '/', '\\'];

const String _episodeCode =
    r'(?:\bS\d{1,2}E\d{1,3}|\b\d{1,2}x\d{1,3}\b)';

const String _halfEpisodeEnd =
    r'\.5(?:v\d)?(?=[ ._\-)\][]|$)(?!-\d)(?![ ._]?(?:gb|mb|ch|kbps|fps|bit|x\d))';

final String _markedHalfEpisode = r'(?<!' + _episodeCode +
    r'.*)(?:\bs\d{1,2}e|\be|\bep(?:isode)?[ .]*|[ .]-[ .]?|^(?=\d{1,3}\.5(?:v\d)? - \D))0*(\d{1,3})' +
    _halfEpisodeEnd +
    r'(?!.*' +
    _episodeCode +
    r')';

final String _bareHalfEpisode = r'(?<!' +
    _episodeCode +
    r'.*|\d - .*|(?:imdb|part|seasons?|sezon|сезон)[ ._]?)(?:[ .]|\[)0*(\d{1,3})' +
    _halfEpisodeEnd +
    r'(?!.*(?:' +
    _episodeCode +
    r'| - \d))';

RegExp _i(String pattern) => RegExp(pattern, caseSensitive: false);

/// Registers the full default matcher set on [parser].
///
/// Handler order is significant: the first matcher of a group to match wins
/// (unless it opts out with `skipIfAlreadyFound: false`), and matchers may
/// strip text from the title for the benefit of later ones.
void addDefaults(Parser parser) {
  // Site
  parser.addHandler('site', _i(r'^(www?[., ][\w-]+[. ][\w-]+(?:[. ][\w-]+)?)\s+-\s*'),
      none, const ParserOptions(skipFromTitle: true, remove: true));

  // Episode code
  parser.addHandler(
      'episodeCode',
      RegExp(r'[[(]([a-z0-9]{8}|[A-Z0-9]{8})[\])](?=\.[a-zA-Z0-9]{1,5}$|$)'),
      uppercase,
      const ParserOptions(remove: true));
  parser.addHandler('episodeCode', RegExp(r'\[(?=[A-Z]+\d|\d+[A-Z])([A-Z0-9]{8})]'),
      uppercase, const ParserOptions(remove: true));

  // Resolution
  parser.addHandler('resolution', _i(r'(?<=\b(?:4k|2160p)\b.*)\b(480|720|1080)p\b'),
      value(r'$1p'), const ParserOptions(remove: true));
  parser.addHandler(
      'resolution', _i(r'\b[([]?4k[)\]]?\b'), value('4k'), const ParserOptions(remove: true));
  parser.addHandler('resolution', _i(r'21600?[pi]'), value('4k'),
      const ParserOptions(skipIfAlreadyFound: false, remove: true));
  parser.addHandler('resolution', _i(r'[([]?3840x\d{4}[)\]]?'), value('4k'),
      const ParserOptions(remove: true));
  parser.addHandler('resolution', _i(r'[([]?1920x\d{3,4}[)\]]?'), value('1080p'),
      const ParserOptions(remove: true));
  parser.addHandler('resolution', _i(r'[([]?1280x\d{3}[)\]]?'), value('720p'),
      const ParserOptions(remove: true));
  parser.addHandler('resolution', _i(r'[([]?\d{3,4}x(\d{3,4})[)\]]?'), value(r'$1p'),
      const ParserOptions(remove: true));
  parser.addHandler('resolution', _i(r'(480|720|1080)0[pi]'), value(r'$1p'),
      const ParserOptions(remove: true));
  parser.addHandler('resolution', RegExp(r'(?:BD|HD|M)(720|1080|2160)'), value(r'$1p'),
      const ParserOptions(remove: true));
  parser.addHandler('resolution', _i(r'(480|576|720|1080|2160)[piр]'), value(r'$1p'),
      const ParserOptions(remove: true));
  parser.addHandler('resolution', _i(r'(?:^|\D)(\d{3,4})[pi]'), value(r'$1p'),
      const ParserOptions(remove: true));
  parser.addHandler('resolution', RegExp(r'[([](480|576|720|1080|2160)[)\]]'), value(r'$1p'),
      const ParserOptions(remove: true));

// Date
  //
  // The first seven upstream patterns use `\2` to require the two date
  // separators to be the *same* character. Dart's RegExp has no backreferences,
  // so each pattern is repeated once per separator via [expandBackreference].
  // Those variants drop the outer capture group, which spanned exactly the same
  // characters as the whole match; the parser falls back to the full match.
  final sep = _dateSeparators;
  parser.addHandler(
      'date',
      RegExp(expandBackreference(
          r'(?<=\W|^)(?:[([]?(?:19[6-9]|20[012])[0-9]§(?:0[1-9]|1[012])§(?:0[1-9]|[12][0-9]|3[01])[)\]]?)(?=\W|$)',
          sep)),
      date('YYYY MM DD'),
      const ParserOptions(remove: true));
  parser.addHandler(
      'date',
      RegExp(expandBackreference(
          r'(?<=\W|^)(?:[([]?(?:0[1-9]|[12][0-9]|3[01])§(?:0[1-9]|1[012])§(?:19[6-9]|20[012])[0-9][)\]]?)(?=\W|$)',
          sep)),
      date('DD MM YYYY'),
      const ParserOptions(remove: true));
  parser.addHandler(
      'date',
      RegExp(expandBackreference(
          r'(?<=\W)(?:[([]?(?:0[1-9]|1[012])§(?:0[1-9]|[12][0-9]|3[01])§(?:19[6-9]|20[012])[0-9][)\]]?)(?=\W|$)',
          sep)),
      date('MM DD YYYY'),
      const ParserOptions(remove: true));
  parser.addHandler(
      'date',
      RegExp(expandBackreference(
          r'(?<=\W)(?:[([]?(?:0[1-9]|1[012])§(?:0[1-9]|[12][0-9]|3[01])§(?:[0][1-9]|[0126789][0-9])[)\]]?)(?=\W|$)',
          sep)),
      date('MM DD YY'),
      const ParserOptions(remove: true));
  parser.addHandler(
      'date',
      RegExp(expandBackreference(
          r'(?<=\W)(?:[([]?(?:0[1-9]|[12][0-9]|3[01])§(?:0[1-9]|1[012])§(?:[0][1-9]|[0126789][0-9])[)\]]?)(?=\W|$)',
          sep)),
      date('DD MM YY'),
      const ParserOptions(remove: true));
  parser.addHandler(
      'date',
      RegExp(
          expandBackreference(
              r'(?<=\W|^)(?:[([]?(?:0?[1-9]|[12][0-9]|3[01])[. ]?(?:st|nd|rd|th)?§(?:feb(?:ruary)?|jan(?:uary)?|mar(?:ch)?|apr(?:il)?|may|june?|july?|aug(?:ust)?|sept?(?:ember)?|oct(?:ober)?|nov(?:ember)?|dec(?:ember)?)§(?:19[7-9]|20[012])[0-9][)\]]?)(?=\W|$)',
              sep),
          caseSensitive: false),
      date('DD MMM YYYY'),
      const ParserOptions(remove: true));
  parser.addHandler(
      'date',
      RegExp(
          expandBackreference(
              r'(?<=\W|^)(?:[([]?(?:0?[1-9]|[12][0-9]|3[01])[. ]?(?:st|nd|rd|th)?§(?:feb(?:ruary)?|jan(?:uary)?|mar(?:ch)?|apr(?:il)?|may|june?|july?|aug(?:ust)?|sept?(ember)?|oct(?:ober)?|nov(?:ember)?|dec(?:ember)?)§(?:0[1-9]|[0126789][0-9])[)\]]?)(?=\W|$)',
              sep),
          caseSensitive: false),
      date('DD MMM YY'),
      const ParserOptions(remove: true));
  parser.addHandler(
      'date',
      RegExp(r'(?<=\W|^)([([]?20[012][0-9](?:0[1-9]|1[012])(?:0[1-9]|[12][0-9]|3[01])[)\]]?)(?=\W|$)'),
      date('YYYYMMDD'),
      const ParserOptions(remove: true));
  parser.addHandler(
      'date',
      RegExp(r'^([([]?(?:19[6-9]|20[012])[0-9] (?:0[1-9]|1[012])-(?:0[1-9]|[12][0-9]|3[01])[)\]]?)(?=\W|$)'),
      date('YYYY MM DD'),
      const ParserOptions(remove: true));
  // Year
  parser.addHandler('year', RegExp(r'[([*]?[ .]?(?<!\bE)((?:19\d|20[012])\d[ .]?-[ .]?(?:19\d|20[012])\d)(?:\s?[*)\]])?'),
      yearRange, const ParserOptions(remove: true));
  parser.addHandler('year', RegExp(r'[([*][ .]?((?:19\d|20[012])\d[ .]?-[ .]?\d{2})(?:\s?[*)\]])?'),
      yearRange, const ParserOptions(remove: true));
  parser.addHandler('year', RegExp(r'(?<=[ .](?:19\d|20[012])\d[ .]+)[([]((?:19\d|20[012])\d)[)\]]'),
      integer, const ParserOptions(remove: true));
  parser.addHandler('year', _i(r'[([*]?(?!^)(?<!\d|Cap[. ]?|\bep[. ]?|\bE|\bS(?=\d{4}E\d))((?:19\d|20[012])\d)(?!\d|kbps)[*)\]]?'),
      integer, const ParserOptions(remove: true));
  parser.addHandler('year', _i(r'^[([]?((?:19\d|20[012])\d)(?!\d|kbps)[)\]]?(?![ ._]+(?:S\d{1,2}[ .]?E\d|E\d{1,3}\b))'),
      integer, const ParserOptions(remove: true));

  // Extended
  parser.addHandler('extended', RegExp('EXTENDED'), boolean);
  parser.addHandler('extended', _i(r'- Extended'), boolean);

  // Convert
  parser.addHandler('convert', RegExp('CONVERT'), boolean);

  // Hardcoded
  parser.addHandler('hardcoded', RegExp('HC|HARDCODED'), boolean);

  // Proper
  parser.addHandler('proper', RegExp('(?:REAL.)?PROPER'), boolean);

  // Repack
  parser.addHandler('repack', RegExp('REPACK|RERIP'), boolean);

  // Retail
  parser.addHandler('retail', _i(r'\bRetail\b'), boolean);

  // Remastered / REKONSTRUKCJA
  parser.addHandler('remastered', _i(r'\bRemaster(?:ed)?\b'), boolean);
  parser.addHandler('remastered', _i(r'\b[[(]?REKONSTRUKCJA[\])]?\b'), boolean);

  // Unrated
  parser.addHandler('unrated', _i(r'\bunrated|uncensored\b'), boolean);

  // Region
  parser.addHandler('region', RegExp(r'R\d\b'), none, const ParserOptions(skipIfFirst: true));

  // Video depth
  parser.addHandler('bitDepth', _i(r'(?:8|10|12)[- ]?bit'), lowercase, const ParserOptions(remove: true));
  parser.addHandler('bitDepth', _i(r'\bhevc\s?10\b'), value('10bit'));
  parser.addHandler('bitDepth', _i(r'\bhdr10\b'), value('10bit'));
  parser.addHandler('bitDepth', _i(r'\bhi10\b'), value('10bit'),
      const ParserOptions(remove: true, skipFromTitle: true));
  parser.addHandler('bitDepth', (ParseContext context) {
    final depth = context.result['bitDepth'];
    if (jsTruthy(depth)) {
      context.result['bitDepth'] = (depth as String).replaceFirst(RegExp(r'[ -]'), '');
    }
    return null;
  });

  // Source
  parser.addHandler('source', _i(r'\b(?:H[DQ][ .-]*)?CAM(?:H[DQ])?(?:[ .-]*Rip)?\b(?![ .-]*(?:S\d|E\d|\((?:19|20)\d{2}\)))'),
      value('CAM'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\b(?:H[DQ][ .-]*)?S[ .-]+print'), value('CAM'),
      const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\b(?:HD[ .-]*)?T(?:ELE)?S(?:YNC)?(?:Rip)?\b'), value('TeleSync'),
      const ParserOptions(remove: true));
  parser.addHandler('source', RegExp(r'\b(?:HD[ .-]*)?T(?:ELE)?C(?:INE)?(?:Rip)?\b'), value('TeleCine'),
      const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bBlu[ .-]*Ray\b(?=.*remux)'), value('BluRay REMUX'),
      const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'(?:BD|BR|UHD)[- ]?remux'), value('BluRay REMUX'),
      const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'(?<=remux.*)\bBlu[ .-]*Ray\b'), value('BluRay REMUX'),
      const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bBlu[ .-]*Ray\b(?![ .-]*Rip)'), value('BluRay'),
      const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bUHD[ .-]*Rip\b'), value('UHDRip'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bP(?:re)?-HD(?:Rip)?\b'), value('SCR'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bHD[ .-]*Rip\b'), value('HDRip'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bMicro[ .-]*HD\b'), value('HDRip'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\b(?:BR|Blu[ .-]*Ray)[ .-]*Rip\b'), value('BRRip'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bBD[ .-]*Rip\b|\bBDR\b|\bBD-RM\b|[[(]BD[\]) .,-]'), value('BDRip'),
      const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\b(?:HD[ .-]*)?DVD[ .-]*Rip\b'), value('DVDRip'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bVHS[ .-]*Rip\b'), value('DVDRip'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\b(?:DVD?|BD|BR|HD)?[ .-]*Scr(?:eener)?\b'), value('SCR'),
      const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bP(?:re)?DVD(?:Rip)?\b'), value('SCR'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bDVD(?:R\d?)?\b'), value('DVD'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bVHS\b'), value('DVD'),
      const ParserOptions(remove: true, skipIfFirst: true));
  parser.addHandler('source', _i(r'\bPPVRip\b'), value('PPVRip'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bHD[ .-]*TV(?:Rip)?\b'), value('HDTV'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bDVB[ .-]*(?:Rip)?\b'), value('HDTV'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bSAT[ .-]*Rips?\b'), value('SATRip'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bTVRips?\b'), value('TVRip'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bR5\b'), value('R5'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bWEB[ .-]*DL(?:Rip)?\b'), value('WEB-DL'), const ParserOptions(remove: true));
  parser.addHandler('source', _i(r'\bWEB[ .-]*Rip\b'), value('WEBRip'), const ParserOptions(remove: true));
  // NOTE: upstream passes `{ remove: true }` in the *transformer* position, where
  // it is discarded (see Parser.addHandler). Faithfully reproduced.
  parser.addHandler('source', _i(r'\b(?:DL|WEB|BD|BR)MUX\b'), const ParserOptions(remove: true));
  parser.addHandler('source', RegExp(r'\b(DivX|XviD)\b'), const ParserOptions(remove: true));

  // HDR
  parser.addHandler('hdr', _i(r'\bDV\b|dolby.?vision|\bDoVi\b'), uniqConcat(value('DV')),
      const ParserOptions(remove: true, skipIfAlreadyFound: false));
  parser.addHandler('hdr', _i(r'HDR10(?:\+|plus)'), uniqConcat(value('HDR10+')),
      const ParserOptions(remove: true, skipIfAlreadyFound: false));
  parser.addHandler('hdr', _i(r'\bHDR(?:10)?\b'), uniqConcat(value('HDR')),
      const ParserOptions(remove: true, skipIfAlreadyFound: false));

  // 3D
  parser.addHandler('threeD', _i(r'\b(3D)\b.*\b(Half-?SBS|H[-\\/]?SBS)\b'), value('3D HSBS'));
  parser.addHandler('threeD', _i(r'\bHalf.Side.?By.?Side\b'), value('3D HSBS'));
  parser.addHandler('threeD', _i(r'\b(3D)\b.*\b(Full-?SBS|SBS)\b'), value('3D SBS'));
  parser.addHandler('threeD', _i(r'\bSide.?By.?Side\b'), value('3D SBS'));
  parser.addHandler('threeD', _i(r'\b(3D)\b.*\b(Half-?OU|H[-\\/]?OU)\b'), value('3D HOU'));
  parser.addHandler('threeD', _i(r'\bHalf.?Over.?Under\b'), value('3D HOU'));
  parser.addHandler('threeD', _i(r'\b(3D)\b.*\b(OU)\b'), value('3D OU'));
  parser.addHandler('threeD', _i(r'\bOver.?Under\b'), value('3D OU'));
  parser.addHandler('threeD', _i(r'\b((?:BD)?3D)\b'), value('3D'), const ParserOptions(skipIfFirst: true));

  // Codec
  parser.addHandler('codec', _i(r'\b[xh][-. ]?26[45]'), lowercase, const ParserOptions(remove: true));
  parser.addHandler('codec', _i(r'\bhevc(?:\s?10)?\b'), value('hevc'),
      const ParserOptions(remove: true, skipIfAlreadyFound: false));
  parser.addHandler('codec', _i(r'\b(?:dvix|mpeg2|divx|xvid|avc|(?<!-)av1)\b'), lowercase,
      const ParserOptions(remove: true, skipIfAlreadyFound: false));
  parser.addHandler('codec', (ParseContext context) {
    final codec = context.result['codec'];
    if (jsTruthy(codec)) {
      context.result['codec'] = (codec as String).replaceFirst(RegExp(r'[ .-]'), '');
    }
    return null;
  });

  // Audio
  parser.addHandler('audio', _i(r'7\.1[. ]?Atmos\b'), value('7.1 Atmos'), const ParserOptions(remove: true));
  parser.addHandler('audio', _i(r'\b(?:mp3|Atmos|DTS(?:-HD)?|TrueHD)\b'), lowercase);
  parser.addHandler('audio', _i(r'\bFLAC(?:\+?2\.0)?(?:x[2-4])?\b'), value('flac'), const ParserOptions(remove: true));
  parser.addHandler('audio', _i(r'\bEAC-?3(?:[. -]?[256]\.[01])?'), value('eac3'),
      const ParserOptions(remove: true, skipIfAlreadyFound: false));
  parser.addHandler('audio', _i(r'\bAC-?3(?:[.-]5\.1|x2\.?0?)?\b'), value('ac3'),
      const ParserOptions(remove: true, skipIfAlreadyFound: false));
  parser.addHandler('audio', _i(r'\b5\.1(?:x[2-4]+)?\+2\.0(?:x[2-4])?\b'), value('2.0'),
      const ParserOptions(remove: true, skipIfAlreadyFound: false));
  parser.addHandler('audio', _i(r'\b2\.0(?:x[2-4]|\+5\.1(?:x[2-4])?)\b'), value('2.0'),
      const ParserOptions(remove: true, skipIfAlreadyFound: false));
  parser.addHandler('audio', _i(r'\b5\.1ch\b'), value('ac3'),
      const ParserOptions(remove: true, skipIfAlreadyFound: false));
  parser.addHandler('audio', _i(r'\bDD5[. ]?1\b'), value('dd5.1'), const ParserOptions(remove: true));
  parser.addHandler('audio', RegExp(r'\bQ?AAC(?:[. ]?2[. ]0|x2)?\b'), value('aac'), const ParserOptions(remove: true));
  parser.addHandler('audioChannels', RegExp(r'\[[257][.-][01]]'), lowercase, const ParserOptions(remove: true));
  parser.addHandler('audioChannels',
      _i(r'(?:\b(?:DTS(?:-?HD)?(?:[ .-]?MA)?|E?AC-?3|AAC|TrueHD|FLAC|Opus|L?PCM)[ .-]?|[[(])([257]\.[01])(?:ch)?(?=[\]) .,_-]|$)'),
      none, const ParserOptions(remove: true));

  // Group
  // NOTE: as above, `{ remove: true }` sits in the transformer position and is
  // therefore ignored by upstream; reproduced verbatim.
  parser.addHandler(
      'group',
      _i(r'- ?(?!\d+$|S\d+|\d+x|ep?\d+|[^[]+]$)([^\-. []+[^\-. [)\]\d][^\-. [)\]]*)(?:\[[\w.-]+])?(?=\.\w{2,4}$|$)'),
      const ParserOptions(remove: true));

  // Container
  parser.addHandler('container', _i(r'\.?[[(]?\b(MKV|AVI|MP4|WMV|MPG|MPEG)\b[\])]?'), lowercase);

  // Volumes
  parser.addHandler('volumes', _i(r'\bvol(?:s|umes?)?[. -]*(?:\d{1,2}[., +/\\&-]+)+\d{1,2}\b'),
      range, const ParserOptions(remove: true));
  parser.addHandler('volumes', (ParseContext context) {
    final startIndex = matchIndexOf(context.matched['year']) ?? 0;
    final match = RegExp(r'\bvol(?:ume)?[. -]*(\d{1,2})', caseSensitive: false)
        .firstMatch(jsSlice(context.title, startIndex));
    if (match == null) return null;
    // Upstream stores the raw text under `match` (not `rawMatch`) here.
    context.matched['volumes'] = <String, dynamic>{
      'match': matchGroup(match, 0),
      'matchIndex': match.start,
    };
    context.result['volumes'] = [jsParseInt(matchGroup(match, 1)!)];
    return MatchResult(rawMatch: matchGroup(match, 0), matchIndex: match.start, remove: true);
  });

  // Season
  parser.addHandler('seasons',
      _i(r'(?:(?:\bthe\W)?\bcomplete\W+)?(?:\ball\W)?(?:\bseasons?[. ]?[([]?|\b(?=s\d))((?:s?\d{1,2})[. ]*-[. ]*s?\d{1,2})[)\]]?[. ]*[([]\d{1,2}[. ]?of[. ]?\d{1,2}[)\]]'),
      range, const ParserOptions(remove: true));
  parser.addHandler('seasons', _i(r'(?:complete\W|seasons?\W|\W|^)((?:s\d{1,2}[., +/\\&-]+)+s\d{1,2}\b)'),
      range, const ParserOptions(remove: true));
  parser.addHandler('seasons', _i(r'(?:complete\W|seasons?\W|\W|^)[([]?(s\d{2,}-\d{2,}\b)[)\]]?'),
      range, const ParserOptions(remove: true));
  parser.addHandler('seasons', _i(r'(?:complete\W|seasons?\W|\W|^)[([]?(s[1-9]-[2-9]\b)[)\]]?'),
      range, const ParserOptions(remove: true));
  parser.addHandler('seasons', _i(r'(?:[^\wЀ-ӿ-]|^)(\d{1,2}-\d{1,2})[xх](?!26[45]\b)\d{1,3}\b'), range);
  parser.addHandler(
      'seasons',
      _i(r'(?:(?:\bthe\W)?\bcomplete\W+)?(?:\ball\W)?(?:seasons?|[Сс]езони?|sezon|temporadas?|stagioni|s[äæ]song|sesong|staffel)[. ]?[-:]?[. ]?[([]?((?:\d{1,2}(?: ?[,/\\&][, /\\&]*(?:and )?| ))+\d{1,2}\b)[)\]]?'),
      range,
      const ParserOptions(remove: true));
  parser.addHandler(
      'seasons',
      _i(r'(?:(?:\bthe\W)?\bcomplete\W+)?(?:\ball\W)?(?:seasons|[Сс]езони?|sezon|temporadas?|stagioni|s[äæ]song|sesong|staffel)[. ]?[-:]?[. ]?[([]?((?:\d{1,2}[. -]+)+0?[1-9]\d?\b)(?![. _]?(?:seri|сери))[)\]]?'),
      range,
      const ParserOptions(remove: true));
  parser.addHandler(
      'seasons',
      _i(r'(?:(?:\bthe\W)?\bcomplete\W+)?(?:\ball\W)?season[. ]?[([]?((?:\d{1,2}[. -]+)+[1-9]\d?\b)[)\]]?(?!.*\.\w{2,4}$)'),
      range,
      const ParserOptions(remove: true));
  parser.addHandler(
      'seasons',
      _i(r'(?:(?:\bthe\W)?\bcomplete\W+)?(?:\ball\W)?\b(?:seasons?|s[äæ]song|sesong|staffel)[. -]?(\d{1,2}[. -]?(?:to|thru|and|till|\+|:)[. -]?\d{1,2})\b'),
      range,
      const ParserOptions(remove: true));
  parser.addHandler('seasons', _i(r'\bfirst[. ](\d{1,2})[. ]seasons\b'), rangeUpTo);
  parser.addHandler('seasons', _i(r'\bS((?:19|20)\d{2})E0*[1-9]\d{0,2}\b'), array(integer));
  parser.addHandler('seasons', _i(r'\bS(\d{3})[. ]?E\d{1,4}\b'), array(integer));
  parser.addHandler('seasons', _i(r'(\d{1,2})(?:-?й)?[. _]?(?:[Сс]езон|sez(?:on)?)(?:\W?\D|$)'), array(integer));
  parser.addHandler('seasons',
      _i(r'(?:(?:\bthe\W)?\bcomplete\W)?(?:saison|seizoen|sezona|sezon(?:SO?)?|stagione|seasons?|series|temp(?:orada)?|sesong|s[äæ]song|sæson|staffel):?[. ]?(\d{1,2})(?!\d)'),
      array(integer));
  parser.addHandler('seasons', _i(r'[Сс]езон:?[. _]?№?(\d{1,2})(?!\d)'), array(integer));
  parser.addHandler('seasons', _i(r'(?:\D|^)(\d{1,2})Â?[°ºªa]?[. ]*temporada'), array(integer), const ParserOptions(remove: true));
  parser.addHandler('seasons', _i(r't(\d{1,3})(?:[ex]+|$)'), array(integer), const ParserOptions(remove: true));
  parser.addHandler('seasons', _i(r"(?:(?:\bthe\W)?\bcomplete)?(?:[^\w'’]|^)so?([01]?[0-5]?[1-9])(?:[\Wex]|\d{2}\b)"),
      array(integer), const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('seasons', _i(r'(?:[^\w-]|^)s(\d{1,2})$'), array(integer));
  parser.addHandler('seasons', _i(r'(?:so?|t)(\d{1,2})[. ]?[xх-]?[. ]?(?:e|x|х|ep|-|\.)[. ]?\d{1,4}(?:[abc]|v0?[1-4]|\D|$)'), array(integer));
  parser.addHandler('seasons', _i(r"(?:(?:\bthe\W)?\bcomplete\W)?(?:\W|^)(\d{1,2})[. ]?(?:st|nd|rd|th)[. ]*season"), array(integer));
  parser.addHandler('seasons', _i(r'^(\d{1,2})[. ]season$'), array(integer));
  parser.addHandler('seasons', RegExp(r'(?:\D|^)(\d{1,2})[Xxх]\d{1,3}(?:\D|$)'), array(integer));
  parser.addHandler('seasons', _i(r'^x(?!26[45]\b|(?:480|576|720|1080|2160)\b)(\d{1,2})\d{2}(?= - )'), array(integer));
  parser.addHandler('seasons', RegExp(r'\bSn([1-9])(?:\D|$)'), array(integer));
  parser.addHandler('seasons', _i(r'\bv(\d{1,2})e\d{1,3}\b'), array(integer));
  parser.addHandler('seasons', _i(r'(?<=[a-z]\.)(?<!sezon\.)(\d{1,2})\.\d{1,3}(?:-\d{1,3})?\.ser[ijya]{0,3}(?=\.)'), array(integer));
  parser.addHandler('seasons', _i(r'(?:^|[ ._-])(\d{1,2})EP?\d{2,3}(?=[ ._-]|$)'), array(integer));
  parser.addHandler('seasons', _i(r'\bs\.(\d{1,2})[ .]ep\.\d{1,4}'), array(integer));
  parser.addHandler('seasons', RegExp(r'[[(](\d{1,2})\.(?!5[)\]])\d{1,3}[)\]]'), array(integer));
  parser.addHandler('seasons', RegExp(r'-\s?(\d{1,2})\.\d{2,3}\s?-'), array(integer));
  parser.addHandler('seasons', RegExp(r'^(\d{1,2})\.\d{2,3} - '), array(integer),
      const ParserOptions(skipIfBefore: ['year, source', 'resolution']));
  parser.addHandler('seasons', RegExp(r'^(\d{1,2})\.\d{2,3}[. ]+(?=[^\W\d]|[À-ɏЀ-ӿ])'),
      array(integer), const ParserOptions(skipIfBefore: ['year']));
  // Upstream uses `\2` to require the captured digit to repeat; Dart has no
  // backreferences, so the digit is expanded over 0-9. The outer capture group
  // is preserved so `array(integer)` still receives the season number.
  parser.addHandler(
      'seasons',
      RegExp(expandBackreference(
          r'(?:^|/)(?!20-20)(\d{1,2}(?=-\d{2}\b(?!-\d))|§(?=-(?:1\d{2}|§\d{2})(?=[ ._]|$)))',
          List<String>.generate(10, (index) => '$index'))),
      array(integer),
      const ParserOptions(skipIfBefore: ['year']));
  parser.addHandler('seasons', RegExp(r'[^\w-](\d{1,2})-\d{2}(?=\.\w{2,4}$)'), array(integer));
  parser.addHandler('seasons', RegExp(r'(?<!\bEp?(?:isode)? ?\d+\b.*)\b(\d{2})[ ._]\d{2}(?:.F)?\.\w{2,4}$'), array(integer));
  parser.addHandler('seasons', _i(r'\bEp(?:isode)?\W+(?:#|(?!\d{1,2}\.5\b))(\d{1,2})\.\d{1,3}\b'), array(integer));

  // Adds the single-season shorthand when exactly one season was found.
  parser.addHandler('season', (ParseContext context) {
    final seasons = context.result['seasons'];
    if (seasons is List && seasons.length == 1) {
      context.result['season'] = seasons[0];
    }
    return null;
  });

  // Episode
  parser.addHandler('episodes', _i(r'(?<=[a-z]\.)(?<!sezon\.)\d{1,2}\.(\d{1,3}(?:-\d{1,3})?)\.ser[ijya]{0,3}(?=\.)'), range);
  parser.addHandler('episodes', _i(r'(?:[\W\d]|^)e[ .]?[([]?(\d{1,3}(?:[ .-]*(?:[&+]|e){1,2}[ .]?\d{1,3})+)(?:\W|$)'), range);
  parser.addHandler('episodes', _i(r'\bs\d{1,2}[ .-]?e(\d{1,3}-?e\d{1,3})(?:\W|$)'), list);
  parser.addHandler('episodes', _i(r'(?:[\W\d]|^)ep[ .]?[([]?(\d{1,3}(?:[ .-]*(?:[&+]|ep){1,2}[ .]?\d{1,3})+)(?:\W|$)'), range);
  parser.addHandler('episodes', _i(r'(?:[\W\d]|^)\d+[xх][ .]?[([]?(\d{1,3}(?:[ .]?[xх][ .]?\d{1,3})+)(?:\W|$)'), range);
  parser.addHandler('episodes', _i(r'(?:[\W\d]|^)(?:episodes?|[Сс]ерии:?)[ .]?[([]?(\d{1,3}(?:[ .+]*[&+][ .]?\d{1,3})+)(?:\W|$)'), range);
  parser.addHandler('episodes', _i(r'[([]?(?:\D|^)(\d{1,3}[ .]?ao[ .]?\d{1,3})[)\]]?(?:\W|$)'), range);
  parser.addHandler('episodes', _i(r'(?:[\W\d]|^)(?:e|eps?|episodes?|[Сс]ерии:?|\d+[xх])[ .]*[([]?(\d{1,3}(?:-\d{1,3})+)(?!\.\d)(?:\W|$)'), range);
  parser.addHandler('episodes', _i(r'(?:[\W\d]|^)(?:eps?|episodes?)[ .]*[([]?(\d{1,3}[ .]+(?:to|thru|till)[ .]+\d{1,3})(?:\W|$)'), range);
  parser.addHandler('episodes', RegExp('[Сс]ерии:?\\s+(\\d{1,4})\\s+из\\s+\\d{1,4}'), rangeUpTo);
  parser.addHandler('episodes', RegExp(r'\[(\d{1,4})\s+из\s+\d{1,4}]'), rangeUpTo);
  parser.addHandler('episodes', _i(r'(?:[\W\d]|^)(?:eps?|episodes?)[ .]*[([]?(\d{1,2}[ .]+-[ .]+\d{1,3}|\d{3,4}[ .]+-[ .]+\d{3,4})(?!\.\d|[ .]*-)(?:\W|$)'), range);
  parser.addHandler('episodes', _i(r'(?:\W|^)(\d{1,3}(?:[ .]*~[ .]*\d{1,3})+)(?:\W|$)'), range);
  parser.addHandler('episodes', _i(r'(?:so?|t)\d{1,2}[. ]?[xх-]?[. ]?(?:e|x|х|ep)[. ]?(\d{1,4})(?:[abc]|v0?[1-4]|\D|$)'), array(integer));
  parser.addHandler('episodes', _i(r'(?:so?|t)\d{1,2}\s?[-.]\s?(\d{1,4})(?:[abc]|v0?[1-4]|\D|$)'), array(integer));
  parser.addHandler('episodes', _i(r'\b(?:so?|t)\d{2}(\d{2})\b'), array(integer));
  parser.addHandler('episodes', _i(r'\bS(?:19|20)\d{2}E(0*[1-9]\d{0,2})\b'), array(integer));
  parser.addHandler('episodes', _i(r'\bS\d{3}[. ]?E(\d{1,4})\b'), array(integer));
  parser.addHandler('episodes', _i(r'\bv\d{1,2}e(\d{1,3})\b'), array(integer));
  parser.addHandler('episodes', _i(r'\bs\.\d{1,2}[ .]ep\.(\d{1,4})'), array(integer));
  parser.addHandler('episodes', _i(r'-\s(\d{1,3}[ .]*-[ .]*\d{1,3})(?!-\d)(?:\W|$)'), range);
  parser.addHandler('episodes', _i(r's\d{1,2}\s?\((\d{1,3}[ .]*-[ .]*\d{1,3})\)'), range);
  parser.addHandler('episodes', RegExp(r'(?:^|/)(?!20-20)\d{1,2}-(\d{2})\b(?!-\d)'), array(integer),
      const ParserOptions(skipIfBefore: ['year']));
  parser.addHandler('episodes', RegExp(r'(?:^|/)(?:1-1|2-2|3-3|4-4|5-5|6-6|7-7|8-8|9-9)(\d{2})(?=[ ._]|$)'), array(integer),
      const ParserOptions(skipIfBefore: ['year']));
  parser.addHandler('episodes', RegExp(r'(?:^|/)\d-(1\d{2})(?=[ ._]|$)'), array(integer),
      const ParserOptions(skipIfBefore: ['year']));
  parser.addHandler('episodes', RegExp(r'(?<!\d-)\b\d{1,2}-(\d{2})(?=\.\w{2,4}$)'), array(integer));
  parser.addHandler('episodes', _i(r'(?<=^\[.+].+)[. ]+-[. ]+(\d{1,4})[. ]+(?=\W)'), array(integer));
  parser.addHandler('episodes', _i(r"(?<!(?:seasons?|series|[Сс]езони?)\W*)(?:[ .([-]|^)(\d{1,3}(?:[ .]?[,&+~][ .]?\d{1,3})+)(?:[ .)\]-]|$)"), range);
  parser.addHandler('episodes', _i(r'^(?!20-20)(\d{1,3}(?:-\d{1,3})+)(?!\.\d)(?:[ .)(\]]|$)'), range,
      const ParserOptions(skipIfBefore: ['year']));
  parser.addHandler('episodes',
      _i(r'(?<!^\d{1,3}(?:-\d{1,3})+[ .)(\]-].*)(?<!(?:seasons?|[Сс]езони?)\W*)(?!20-20)(?:[ .([]|(?<!^\d{1,3}(?:-\d{1,3})*)-)(\d{1,3}(?:-\d{1,3})+)(?!\.\d)(?:[ .)(\]]|-\D|$)'),
      range);
  parser.addHandler('episodes', _i(r'\bEp(?:isode)?\W+(?:#|(?!\d{1,2}\.5\b))\d{1,2}\.(\d{1,3})\b'), array(integer));
  parser.addHandler('episodes',
      _i(r"(?:\b[ée]p?(?:isode)?|[Ээ]пизод|[Сс]ер(?:ии|ия|\.)?|seri[jy]a|caa?p(?:itulo)?|epis[oó]dio|epizoda|odcinek|avsnitt|aflevering|folge|jakso|puntata)[. ]?[-:#№]?[. ]?(\d{1,4})(?:[abc]|v0?[1-4]|\W|$)"),
      array(integer));
  parser.addHandler('episodes', _i(r'\d{1,2}\.sezon\.(\d{1,3}\.\d{1,3})\.ser'), range);
  parser.addHandler('episodes', _i(r'\b(\d{1,3}-\d{1,3})[ ._]*(?:ser(?:i?[iyj]a|\b)|[Сс]ер(?:ии|ия|\.)?)'), range);
  parser.addHandler('episodes', _i(r'\b(\d{1,3})(?:-?(?:я|ja|ya))?[ ._-]*(?:ser(?:i?[iyj]a|\b)|[Сс]ер(?:ии|ия|\.)?)'), array(integer));
  parser.addHandler('episodes', RegExp(r'(?:\D|^)\d{1,2}[. ]?[Xxх][. ]?(\d{1,3})(?:[abc]|v0?[1-4]|\D|$)'), array(integer));
  parser.addHandler('episodes', _i(r'^x(?!26[45]\b|(?:480|576|720|1080|2160)\b)\d{1,2}(\d{2})(?= - )'), array(integer));
  parser.addHandler('episodes', RegExp(r'[[(]\d{1,2}\.(?!5[)\]])(\d{1,3})[)\]]'), array(integer));
  parser.addHandler('episodes', _i(r'(?:^|[ ._-])\d{1,2}EP?(\d{2,3})(?=[ ._-]|$)'), array(integer));
  parser.addHandler('episodes', RegExp(r'\b[Ss](?:eason\W?)?\d{1,2}[ .](\d{1,2})\b'), array(integer));
  parser.addHandler('episodes', _i(r'\bseries[ .]?\d{1,2}(?:, |\.| - ?|- | )(\d{1,3})(?=[ .]+[^\W\d])'), array(integer));
  parser.addHandler('episodes', RegExp(r'-\s?\d{1,2}\.(\d{2,3})\s?-'), array(integer));
  parser.addHandler('episodes', RegExp(r'^\d{1,2}\.(\d{2,3}) - '), array(integer),
      const ParserOptions(skipIfBefore: ['year, source', 'resolution']));
  parser.addHandler('episodes', RegExp(r'^\d{1,2}\.(\d{2,3})[. ]+(?=[^\W\d]|[À-ɏЀ-ӿ])'), array(integer),
      const ParserOptions(skipIfBefore: ['year']));
  parser.addHandler('episodes', _i(r'(?<=\D|^)(?!(?<=\d\.)5\b)(\d{1,3})[. ]?(?:of|из|iz)[. ]?\d{1,3}(?=\D|$)'), array(integer));
  parser.addHandler('episodes', RegExp(r'\b\d{2}[ ._-](\d{2})(?:.F)?\.\w{2,4}$'), array(integer));
  parser.addHandler('episodes', RegExp(r'(?<!^)\[(\d{2,3})](?!(?:\.\w{2,4})?$)'), array(integer));
  parser.addHandler('episodes', _i(r'\bodc[. ]+(\d{1,3})\b'), array(integer));
  parser.addHandler('episodes', _i(r'(?<![a-z\d])(\d{1,3})ep(?![a-z\d]|[ ._-]?\d)'), array(integer));
  parser.addHandler(
      'episodes',
      _i('(?<=^(?:\\[[^\\]]+\\])?[a-z]{3,})(?<!part|pt|cd|dvd|dis[ck]|vol|title|season)(0\\d{1,2})'
          '(?=\\.(?:$videoExtensions|$subtitleExtensions)\$)'),
      array(integer));
  parser.addHandler('episodes', _i(r'\b(\d{1,4})\.?[ ._-]*b[öo]l[üu]m\b'), array(integer));
  parser.addHandler('episodes', _i(r'\bb[öo]l[üu]m[ ._-]*(\d{1,4})\b'), array(integer));
  parser.addHandler('episodes', _i(r'\bOVA[ ._]+(\d{1,2})(?:v\d)?\b(?![ .]*[-~&+.]\d)'), array(integer),
      const ParserOptions(skipFromTitle: true));

  parser.addHandler('episodes', RegExp(r'^(\d{3,4})[. ]+-[. ]+(?=[^\W\d])'), array(integer),
      const ParserOptions(remove: true, skipIfBefore: ['year']));

  parser.addHandler('episodes', RegExp(_markedHalfEpisode, caseSensitive: false), array(integer));
  parser.addHandler('episodes', RegExp(_bareHalfEpisode, caseSensitive: false), array(integer));

  // A bare number may be both an absolute episode and a season+episode code.
  parser.addHandler('episodes', (ParseContext context) {
    if (jsTruthy(context.result['episodes'])) return null;

    final title = context.title;
    final matched = context.matched;

    int indexOf(String key) {
      final index = matchIndexOf(matched[key]);
      return index != null && index > 0 ? index : 0;
    }

    final startIndexes =
        ['year', 'seasons'].map(indexOf).where((index) => index > 0).toList();
    final endIndexes = ['resolution', 'source', 'codec', 'audio']
        .map(indexOf)
        .where((index) => index > 0)
        .toList();

    final startIndex = startIndexes.isEmpty ? 0 : startIndexes.reduce(mathMin);
    final endIndex = endIndexes.isEmpty ? title.length : mathMin(endIndexes.reduce(mathMin), title.length);

    final beginningTitle = jsSlice(title, 0, endIndex);
    final middleTitle = jsSlice(title, startIndex, endIndex);

    // Prefer the last match found while scanning the title; only if that finds
    // nothing, fall back to the start of the middle section.
    final beginningMatches = _beginningEpisode.allMatches(beginningTitle);
    final Match? match = beginningMatches.isNotEmpty
        ? beginningMatches.last
        : RegExp(
                r'^(?:[([-][ .]?)?(\d{1,4})(?![. _]?(?:-?й)?[. _]?(?:[Сс]езон|sez(?:on)?\b)(?![. _]?finali))(?:a|b|v\d)?(?!\Wmovie|\Wfilm|-\d)(?:\W|$)',
                caseSensitive: false)
            .firstMatch(middleTitle);

    if (match != null) {
      final group = matchGroup(match, 1) ?? '';
      context.result['episodes'] = [jsParseInt(group.replaceAll(RegExp(r'\D'), ''))];
      return MatchResult(matchIndex: title.indexOf(matchGroup(match, 0)!));
    }
    return null;
  });

  parser.addHandler('episodes', (ParseContext context) {
    final result = context.result;
    if (!jsTruthy(result['episodes']) &&
        !jsTruthy(result['seasons']) &&
        !jsTruthy(result['year'])) {
      final match = RegExp(r'(?<=[^\d\s][.-]|\s\.)(\d{1,2})\.(\d{2,3})(?=\.\w{2,4}$)')
          .firstMatch(context.title);
      if (match != null) {
        result['seasons'] = [jsParseInt(matchGroup(match, 1)!)];
        result['season'] = (result['seasons'] as List)[0];
        result['episodes'] = [jsParseInt(matchGroup(match, 2)!)];
        return MatchResult(matchIndex: match.start);
      }
    }
    return null;
  });

  parser.addHandler('episodes', (ParseContext context) {
    final result = context.result;
    if (!jsTruthy(result['episodes']) && !jsTruthy(result['date'])) {
      Match? match;
      final yearIndex = matchIndexOf(context.matched['year']);
      if (yearIndex != null) {
        match = RegExp(
                r'^(?:[ .]| - ?|\. (?=\d{1,3} ?(?:\[|$)))(?!(?:480|576|720)\b)(\d{1,3})(?:v\d)?-?(?=[ .([-]|$)(?![ .,-]*\d|[ .]*(?:cd|dvd|dis[ck]|bits?|films?|movies?|[mg]b)\b)',
                caseSensitive: false)
            .firstMatch(jsSlice(context.title, yearIndex));
      }
      final resolutionIndex = matchIndexOf(context.matched['resolution']);
      if (match == null && resolutionIndex != null) {
        match = RegExp(r'^ (\d{3,4}) (?=[^\W\d])')
            .firstMatch(jsSlice(context.title, resolutionIndex));
      }
      if (match != null) {
        result['episodes'] = [jsParseInt(matchGroup(match, 1)!)];
      }
    }
    return null;
  });

  parser.addHandler('halfEpisode', RegExp(_markedHalfEpisode, caseSensitive: false), boolean);
  parser.addHandler('halfEpisode', RegExp(_bareHalfEpisode, caseSensitive: false), boolean);

  // Adds the single-episode shorthand when exactly one episode was found.
  parser.addHandler('episode', (ParseContext context) {
    final episodes = context.result['episodes'];
    if (episodes is List && episodes.length == 1) {
      context.result['episode'] = episodes[0];
    }
    return null;
  });

  parser.addHandler('source', RegExp(r'\b(?:WEB|web)\b(?![ .-]*DL)'), value('WEB'),
      const ParserOptions(remove: true, skipIfFirst: true));

  // Complete
  parser.addHandler('complete', _i(r'(?:\bthe\W)?(?:\bcomplete|collection|dvd)?\b[ .]?\bbox[ .-]?set\b'), boolean);
  parser.addHandler('complete', _i(r'(?:\bthe\W)?(?:\bcomplete|collection|dvd)?\b[ .]?\bmini[ .-]?series\b'), boolean);
  parser.addHandler('complete', _i(r'(?:\bthe\W)?\b(?:complete|full|all)\b.*\b(?:series|seasons|collection|episodes|set|pack|movies)\b'), boolean);
  parser.addHandler('complete', _i(r'\b(?:series|seasons|movies?)\b.*\b(?:complete|collection)\b'), boolean);
  parser.addHandler('complete', _i(r'(?:\bthe\W)?\bultimate\b[ .]\bcollection\b'), boolean,
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('complete', _i(r'\bcollection\b.*\b(?:set|pack|movies)\b'), boolean);
  parser.addHandler('complete', _i(r'\b(collection|completa)\b'), boolean, const ParserOptions(skipFromTitle: true));
  parser.addHandler('complete', _i(r'\bkolekcja\b(?:\Wfilm(?:y|ów|ow)?)?'), boolean, const ParserOptions(remove: true));
  parser.addHandler('complete', _i(r'duology|trilogy|quadr[oi]logy|tetralogy|pentalogy|hexalogy|heptalogy|anthology'), boolean,
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('complete', _i(r'\bsaga\b'), boolean, const ParserOptions(skipFromTitle: true));

  // Language
  parser.addHandler('languages', _i(r'\bmulti(?:ple)?[ .-]*(?:su?$|sub\w*|dub\w*)\b|msub'), uniqConcat(value('multi subs')),
      const ParserOptions(skipIfAlreadyFound: false, remove: true));
  parser.addHandler('languages', _i(r'\bmulti(?:ple)?[ .-]*(?:lang(?:uages?)?|audio|VF2)?\b'), uniqConcat(value('multi audio')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\btri(?:ple)?[ .-]*(?:audio|dub\w*)\b'), uniqConcat(value('multi audio')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bdual[ .-]*(?:au?$|[aá]udio|line)\b'), uniqConcat(value('dual audio')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bdual\b(?![ .-]*sub)'), uniqConcat(value('dual audio')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bengl?(?:sub[A-Z]*)?\b'), uniqConcat(value('english')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\beng?sub[A-Z]*\b'), uniqConcat(value('english')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bing(?:l[eéê]s)?\b'), uniqConcat(value('english')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\benglish\W+(?:subs?|sdh|hi)\b'), uniqConcat(value('english')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bEN\b'), uniqConcat(value('english')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\benglish?\b'), uniqConcat(value('english')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:JP|JAP|JPN)\b'), uniqConcat(value('japanese')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(japanese|japon[eê]s)\b'), uniqConcat(value('japanese')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:KOR|kor[ .-]?sub)\b'), uniqConcat(value('korean')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(korean|coreano)\b'), uniqConcat(value('korean')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:traditional\W*chinese|chinese\W*traditional)(?:\Wchi)?\b'), uniqConcat(value('taiwanese')),
      const ParserOptions(skipIfAlreadyFound: false, remove: true));
  parser.addHandler('languages', _i(r'\bzh-hant\b'), uniqConcat(value('taiwanese')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:mand[ae]rin|ch[sn])\b'), uniqConcat(value('chinese')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', RegExp(r'\bCH[IT]\b'), uniqConcat(value('chinese')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(chinese|chin[eê]s|chi)\b'), uniqConcat(value('chinese')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bzh-hans\b'), uniqConcat(value('chinese')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bFR(?:ench|a|e|anc[eê]s)?\b'), uniqConcat(value('french')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(Truefrench|VF[FI])\b'), uniqConcat(value('french')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(VOST(?:FR?|A)?|SUBFRENCH)\b'), uniqConcat(value('french')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bspanish\W?latin|american\W*(?:spa|esp?)'), uniqConcat(value('latino')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false, remove: true));
  parser.addHandler('languages', _i(r'\b(?:audio.)?lat(?:i|ino)?\b'), uniqConcat(value('latino')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:audio.)?(?:ESP|spa|(en[ .]+)?espa[nñ]ola?|castellano)\b'), uniqConcat(value('spanish')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bes(?=[ .,/-]+(?:[A-Z]{2}[ .,/-]+){2,})\b'), uniqConcat(value('spanish')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?<=[ .,/-]+(?:[A-Z]{2}[ .,/-]+){2,})es\b'), uniqConcat(value('spanish')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?<=[ .,/-]+[A-Z]{2}[ .,/-]+)es(?=[ .,/-]+[A-Z]{2}[ .,/-]+)\b'), uniqConcat(value('spanish')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bes(?=\.(?:ass|ssa|srt|sub|idx)$)'), uniqConcat(value('spanish')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bspanish\W+subs?\b'), uniqConcat(value('spanish')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(spanish|espanhol)\b'), uniqConcat(value('spanish')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:p[rt]|en|port)[. (\\/-]*BR\b'), uniqConcat(value('portuguese')),
      const ParserOptions(skipIfAlreadyFound: false, remove: true));
  parser.addHandler('languages', _i(r'\bbr(?:a|azil|azilian)\W+(?:pt|por)\b'), uniqConcat(value('portuguese')),
      const ParserOptions(skipIfAlreadyFound: false, remove: true));
  parser.addHandler('languages', _i(r'\b(?:leg(?:endado|endas?)?|dub(?:lado)?|portugu[eèê]se?)[. -]*BR\b'), uniqConcat(value('portuguese')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bleg(?:endado|endas?)\b'), uniqConcat(value('portuguese')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bportugu[eèê]s[ea]?\b'), uniqConcat(value('portuguese')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bPT[. -]*(?:PT|ENG?|sub(?:s|titles?))\b'), uniqConcat(value('portuguese')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bpt(?=\.(?:ass|ssa|srt|sub|idx)$)'), uniqConcat(value('portuguese')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bpor\b'), uniqConcat(value('portuguese')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bITA\b'), uniqConcat(value('italian')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', RegExp(r'\b(?<!w{3}\.\w+\.)IT(?=[ .,/-]+(?:[a-zA-Z]{2}[ .,/-]+){2,})\b'),
      uniqConcat(value('italian')), const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bit(?=\.(?:ass|ssa|srt|sub|idx)$)'), uniqConcat(value('italian')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bitaliano?\b'), uniqConcat(value('italian')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bgreek[ .-]*(?:audio|lang(?:uage)?|subs?(?:titles?)?)?\b'), uniqConcat(value('greek')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:GER|DEU)\b'), uniqConcat(value('german')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bde(?=[ .,/-]+(?:[A-Z]{2}[ .,/-]+){2,})\b'), uniqConcat(value('german')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?<=[ .,/-]+(?:[A-Z]{2}[ .,/-]+){2,})de\b'), uniqConcat(value('german')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?<=[ .,/-]+[A-Z]{2}[ .,/-]+)de(?=[ .,/-]+[A-Z]{2}[ .,/-]+)\b'), uniqConcat(value('german')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bde(?=\.(?:ass|ssa|srt|sub|idx)$)'), uniqConcat(value('german')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(german|alem[aã]o)\b'), uniqConcat(value('german')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bRUS?\b'), uniqConcat(value('russian')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(russian|russo)\b'), uniqConcat(value('russian')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bUKR\b'), uniqConcat(value('ukrainian')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bukrainian\b'), uniqConcat(value('ukrainian')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bhin(?:di)?\b'), uniqConcat(value('hindi')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:(?<!w{3}\.\w+\.)tel(?!\W*aviv)|telugu)\b'), uniqConcat(value('telugu')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bt[aâ]m(?:il)?\b'), uniqConcat(value('tamil')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', RegExp(r'\b(?<!YTS\.)LT\b'), uniqConcat(value('lithuanian')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\blithuanian\b'), uniqConcat(value('lithuanian')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\blatvian\b'), uniqConcat(value('latvian')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bestonian\b'), uniqConcat(value('estonian')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:PLDUB|Dubbing.PL|Lektor.PL|Film.Polski)\b'), uniqConcat(value('polish')),
      const ParserOptions(skipIfAlreadyFound: false, remove: true));
  parser.addHandler('languages', _i(r'\b(?:Napisy.PL|PLSUB(?:BED)?)\b'), uniqConcat(value('polish')),
      const ParserOptions(skipIfAlreadyFound: false, remove: true));
  parser.addHandler('languages', _i(r'\b(?:(?<!w{3}\.\w+\.)PL|pol)\b'), uniqConcat(value('polish')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(polish|polon[eê]s|polaco)\b'), uniqConcat(value('polish')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bCZ[EH]?\b'), uniqConcat(value('czech')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bczech\b'), uniqConcat(value('czech')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bslo(?:vak|vakian|subs|[\]_)]?\.\w{2,4}$)\b'), uniqConcat(value('slovakian')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', RegExp(r'\bHU\b'), uniqConcat(value('hungarian')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bHUN(?:garian)?\b'), uniqConcat(value('hungarian')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bROM(?:anian)?\b'), uniqConcat(value('romanian')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bRO(?=[ .,/-]*(?:[A-Z]{2}[ .,/-]+)*sub)'), uniqConcat(value('romanian')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bbul(?:garian)?\b'), uniqConcat(value('bulgarian')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:srp|serbian)\b'), uniqConcat(value('serbian')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:HRV|croatian)\b'), uniqConcat(value('croatian')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bHR(?=[ .,/-]*(?:[A-Z]{2}[ .,/-]+)*sub)\b'), uniqConcat(value('croatian')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bslovenian\b'), uniqConcat(value('slovenian')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:(?<!w{3}\.\w+\.)NL|dut|holand[eê]s)\b'), uniqConcat(value('dutch')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bdutch\b'), uniqConcat(value('dutch')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bflemish\b'), uniqConcat(value('dutch')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:DK|danska|dansub|nordic)\b'), uniqConcat(value('danish')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(danish|dinamarqu[eê]s)\b'), uniqConcat(value('danish')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bdan\b(?=.*\.(?:srt|vtt|ssa|ass|sub|idx)$)'), uniqConcat(value('danish')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:(?<!w{3}\.\w+\.|Sci-)FI|finsk|finsub|nordic)\b'), uniqConcat(value('finnish')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bfinnish\b'), uniqConcat(value('finnish')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:(?<!w{3}\.\w+\.)SE|swe|swesubs?|sv(?:ensk)?|nordic)\b'), uniqConcat(value('swedish')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(swedish|sueco)\b'), uniqConcat(value('swedish')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:NOR|norsk|norsub|nordic)\b'), uniqConcat(value('norwegian')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(norwegian|noruegu[eê]s|bokm[aå]l|nob|nor(?=[\]_)]?\.\w{2,4}$))\b'), uniqConcat(value('norwegian')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:arabic|[aá]rabe|ara)\b'), uniqConcat(value('arabic')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\barab.*(?:audio|lang(?:uage)?|sub(?:s|titles?)?)\b'), uniqConcat(value('arabic')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bar(?=\.(?:ass|ssa|srt|sub|idx)$)'), uniqConcat(value('arabic')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:turkish|tur(?:co)?)\b'), uniqConcat(value('turkish')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bvietnamese\b|\bvie(?=[\]_)]?\.\w{2,4}$)'), uniqConcat(value('vietnamese')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bind(?:onesian)?\b'), uniqConcat(value('indonesian')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(thai|tailand[eê]s)\b'), uniqConcat(value('thai')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', RegExp(r'\b(THA|tha)\b'), uniqConcat(value('thai')),
      const ParserOptions(skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(?:malay|may(?=[\]_)]?\.\w{2,4}$)|(?<=subs?\([a-z,]+)may)\b'), uniqConcat(value('malay')),
      const ParserOptions(skipIfFirst: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\bheb(?:rew|raico)?\b'), uniqConcat(value('hebrew')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));
  parser.addHandler('languages', _i(r'\b(persian|persa)\b'), uniqConcat(value('persian')),
      const ParserOptions(skipFromTitle: true, skipIfAlreadyFound: false));

  // Infer Portuguese from season/episode naming.
  parser.addHandler('languages', (ParseContext context) {
    final result = context.result;
    final languages = result['languages'];
    final hasPortugueseOrSpanish = languages is List &&
        ['portuguese', 'spanish'].every((l) => !languages.contains(l));
    if (!jsTruthy(languages) || hasPortugueseOrSpanish) {
      final episodesEntry = context.matched['episodes'];
      final rawEpisodeMatch = episodesEntry?['rawMatch'];
      final fromEpisode = rawEpisodeMatch is String &&
          _i('capitulo|ao').hasMatch(rawEpisodeMatch);
      if (fromEpisode || _i('dublado').hasMatch(context.title)) {
        final existing = languages is List ? languages : <dynamic>[];
        result['languages'] = [...existing, 'portuguese'];
      }
    }
    return const MatchResult(matchIndex: 0);
  });

  // Dubbed
  parser.addHandler('dubbed', _i(r'\b(?:DUBBED|dublado|dubbing|DUBS?)\b'), boolean);
  parser.addHandler('dubbed', (ParseContext context) {
    final languages = context.result['languages'];
    if (languages is List &&
        ['multi audio', 'dual audio'].any(languages.contains)) {
      context.result['dubbed'] = true;
    }
    return const MatchResult(matchIndex: 0);
  });

  // Group
  parser.addHandler('group', RegExp(r'^\[([^[\]]+)]'));
  parser.addHandler('group', RegExp(r'\(([\w-]+)\)(?:$|\.\w{2,4}$)'));
  parser.addHandler('group', (ParseContext context) {
    final groupEntry = context.matched['group'];
    final rawMatch = groupEntry?['rawMatch'];
    if (rawMatch is String && RegExp(r'^\[.+]$').hasMatch(rawMatch)) {
      final entryIndex = matchIndexOf(groupEntry);
      final endIndex = entryIndex != null ? entryIndex + rawMatch.length : 0;

      // Drop an anime group match when another parameter sits inside it.
      final containsOtherMatch = context.matched.values.any((entry) {
        final index = matchIndexOf(entry);
        return index != null && index != 0 && index < endIndex;
      });
      if (containsOtherMatch) {
        context.result.remove('group');
      }
    }
    return const MatchResult(matchIndex: 0);
  });

  // Extension
  // Built with an interpolated string (not a raw one) so the extension lists
  // are substituted; Dart raw strings do not expand `$`.
  parser.addHandler(
      'extension',
      RegExp('\\.($videoExtensions|iso|vob|$subtitleExtensions|idx|ttxt|txt|nfo|html)\$',
          caseSensitive: false),
      lowercase);
}

final RegExp _beginningEpisode = RegExp(
    r'(?<!movie\W*|film\W*|^)(?:[ .]+-[ .]+|[([][ .]*(?!\d+-[a-z]+\)))(\d{1,4})(?![. _]?(?:-?й)?[. _]?(?:[Сс]езон|sez(?:on)?\b)(?![. _]?finali))(?:a|b|v\d|\.\d)?(?:\W|$)(?!movie|film|\d+)',
    caseSensitive: false);

int mathMin(int a, int b) => a < b ? a : b;
