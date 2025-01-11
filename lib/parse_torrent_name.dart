import 'dart:core';

// Original python code by Divij Bindlish, see https://github.com/divijbindlish/parse-torrent-name
class PTN {
  final Map<String, String> patterns = {
    'season': r'(s?([0-9]{1,2}))[ex]', // doesn't handle full season bundles e.g. S01
    'episode': r'([ex]([0-9]{2})(?:[^0-9]|$))',
    'year': r'([\[\(]?((?:19[0-9]|20[012])[0-9])[\]\)]?)', // [012] bit needs to be updated if we make it to 2030 
    'resolution': r'([0-9]{3,4}p)',
    'quality':
        r'((?:PPV\.)?[HP]DTV|(?:HD)?CAM|B[DR]Rip|(?:HD-?)?TS|(?:PPV )?WEB-?DL(?: DVDRip)?|HDRip|DVDRip|DVDRIP|CamRip|W[EB]BRip|BluRay|DvDScr|hdtv|telesync)',
    'codec': r'(xvid|[hx]\.?26[45])',
    'audio':
        r'(MP3|DD5\.?1|Dual[\- ]Audio|LiNE|DTS|AAC[.-]LC|AAC(?:\.?2\.0)?|AC3(?:\.5\.1)?)',
    'group': r'(- ?([^-]+(?:-={[^-]+-?$)?))$',
    'region': r'R[0-9]',
    'extended': r'(EXTENDED(:?.CUT)?)',
    'hardcoded': r'HC',
    'proper': r'PROPER',
    'repack': r'REPACK',
    'container': r'(MKV|AVI|MP4)',
    'widescreen': r'WS',
    'website': r'^(\[ ?([^\]]+?) ?\])',
    'language': r'(rus\.eng|ita\.eng)',
    'sbs': r'(?:Half-)?SBS',
    'unrated': r'UNRATED',
    'size': r'(\d+(?:\.\d+)?(?:GB|MB))',
    '3d': r'3D'
  };

  final Map<String, String> types = {
    'season': 'integer',
    'episode': 'integer',
    'year': 'integer',
    'extended': 'boolean',
    'hardcoded': 'boolean',
    'proper': 'boolean',
    'repack': 'boolean',
    'widescreen': 'boolean',
    'unrated': 'boolean',
    '3d': 'boolean'
  };

  late Map<String, dynamic> torrent;
  String? excessRaw;
  String? groupRaw;
  int? start;
  int? end;
  String? titleRaw;
  Map<String, dynamic>? parts;

  PTN();

  String _escapeRegex(String string) {
    final RegExp specialChars = RegExp(r'[\-\[\]{}()*+?.,\\\^$|#\s]');
    return string.replaceAllMapped(specialChars, (match) => '\\${match[0]}');
  }

  void _part(String name, List<String> match, String? raw, dynamic clean) {
    parts![name] = clean;

    if (match.isNotEmpty) {
      int index = torrent['name']!.indexOf(match[0]);
      if (index == 0) {
        start = match[0].length;
      } else if (end == null || index < end!) {
        end = index;
      }
    }

    if (name != 'excess') {
      if (name == 'group') groupRaw = raw;
      if (raw != null) excessRaw = excessRaw?.replaceFirst(raw, '');
    }
  }

  void _late(String name, String clean) {
    if (name == 'group') {
      _part(name, [], null, clean);
    } else if (name == 'episodeName') {
      clean = clean.replaceAll(RegExp(r'[\._]'), ' ').replaceAll(r'_+$', '').trim();
      _part(name, [], null, clean);
    }
  }

  Map<String, dynamic> parse(String name) {
    parts = {};
    torrent = {'name': name};
    excessRaw = name;
    groupRaw = '';
    start = 0;
    end = null;
    titleRaw = null;

    patterns.forEach((key, pattern) {
      RegExp regex = RegExp(key != 'season' && key != 'episode' && key != 'website'
          ? r'\b' + pattern + r'\b'
          : pattern,
          caseSensitive: false);
      Iterable<RegExpMatch> matches = regex.allMatches(name);

      if (matches.isEmpty) return;

      List<String> matchList = matches.map((e) => e.group(0)!).toList();
      String? raw = matchList.isNotEmpty ? matchList[0] : null;
      dynamic clean;

      if (types.containsKey(key) && types[key] == 'boolean') {
        clean = true;
      } else {
        clean = raw;
        if (types.containsKey(key) && types[key] == 'integer') {
          clean = int.tryParse(raw!);
        }
      }

      if (key == 'group') {
        if (RegExp(patterns['codec']!).hasMatch(clean!) ||
            RegExp(patterns['quality']!).hasMatch(clean)) {
          return;
        }
        if (RegExp(r'[^ ]+ [^ ]+ .+').hasMatch(clean)) {
          key = 'episodeName';
        }
      }

      if (key == 'episode') {
        String subPattern = _escapeRegex(raw!);
        torrent['map'] = torrent['name']!.replaceAll(subPattern, '{episode}');
      }

      _part(key, matchList, raw, clean);
    });

    String rawTitle = torrent['name']!;
    if (end != null) {
      rawTitle = rawTitle.substring(start!, end!).split('(')[0];
    }

    String cleanTitle = rawTitle.replaceFirst(RegExp(r'^ -'), '').trim();
    if (cleanTitle.contains(' ') == false && cleanTitle.contains('.') == true) {
      cleanTitle = cleanTitle.replaceAll('.', ' ');
    }
    cleanTitle = cleanTitle
        .replaceAll('_', ' ')
        .replaceFirst(RegExp(r'([\[\(_]|- )$'), '')
        .trim();

    _part('title', [], rawTitle, cleanTitle);

    return parts!;
  }
}
