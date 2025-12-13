import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:atba/config/constants.dart';

class TorrentioConfig {
  static const Map<String, String> providers = {
    // value, name
    'yts': 'YTS',
    'eztv': 'EZTV',
    'rarbg': 'RARBG',
    '1337x': '1337x',
    'thepiratebay': 'The Pirate Bay',
    'kickasstorrents': 'KickassTorrents',
    'torrentgalaxy': 'TorrentGalaxy',
    'magnetdl': 'MagnetDL',
    'horriblesubs': 'HorribleSubs',
    'nyaasi': 'NyaaSi',
    'tokyotosho': 'TokyoTosho',
    'anidex': 'Anidex',
    'rutor': '🇷🇺 Rutor',
    'rutracker': '🇷🇺 RuTracker',
    'comando': '🇵🇹 Comando',
    'bludv': '🇵🇹 BluDV',
    'torrent9': '🇫🇷 Torrent9',
    'ilcorsaronero': '🇮🇹 IlCorSaRoNeRo',
    'mejortorrent': '🇪🇸 MejorTorrent',
    'wolfmax4k': '🇪🇸 WolfMax4K',
    'cinecalidad': '🇲🇽 CineCalidad',
  };

  static const Map<String, String> languages = {
    'japanese': '🇯🇵 Japanese',
    'russian': '🇷🇺 Russian',
    'italian': '🇮🇹 Italian',
    'portuguese': '🇵🇹 Portuguese',
    'spanish': '🇪🇸 Spanish',
    'latino': '🇲🇽 Latino',
    'korean': '🇰🇷 Korean',
    'chinese': '🇨🇳 Chinese',
    'taiwanese': '🇹🇼 Taiwanese',
    'french': '🇫🇷 French',
    'german': '🇩🇪 German',
    'dutch': '🇳🇱 Dutch',
    'hindi': '🇮🇳 Hindi',
    'telugu': '🇮🇳 Telugu',
    'tamil': '🇮🇳 Tamil',
    'polish': '🇵🇱 Polish',
    'lithuanian': '🇱🇹 Lithuanian',
    'latvian': '🇱🇻 Latvian',
    'estonian': '🇪🇪 Estonian',
    'czech': '🇨🇿 Czech',
    'slovakian': '🇸🇰 Slovakian',
    'slovenian': '🇸🇮 Slovenian',
    'hungarian': '🇭🇺 Hungarian',
    'romanian': '🇷🇴 Romanian',
    'bulgarian': '🇧🇬 Bulgarian',
    'serbian': '🇷🇸 Serbian',
    'croatian': '🇭🇷 Croatian',
    'ukrainian': '🇺🇦 Ukrainian',
    'greek': '🇬🇷 Greek',
    'danish': '🇩🇰 Danish',
    'finnish': '🇫🇮 Finnish',
    'swedish': '🇸🇪 Swedish',
    'norwegian': '🇳🇴 Norwegian',
    'turkish': '🇹🇷 Turkish',
    'arabic': '🇸🇦 Arabic',
    'persian': '🇮🇷 Persian',
    'hebrew': '🇮🇱 Hebrew',
    'vietnamese': '🇻🇳 Vietnamese',
    'indonesian': '🇮🇩 Indonesian',
    'malay': '🇲🇾 Malay',
    'thai': '🇹🇭 Thai',
  };

  static const Map<String, String> qualities = { 
    'brremux': 'BluRay REMUX',
    'hdrall': 'HDR/HDR10+/Dolby Vision',
    'dolbyvision': 'Dolby Vision',
    'dolbyvisionwithhdr': 'Dolby Vision + HDR',
    'threed': '3D',
    'nonthreed': 'Non 3D (DO NOT SELECT IF NOT SURE)',
    '4k': '4K',
    '1080p': '1080p',
    '720p': '720p',
    '480p': '480p',
    'other': 'Other (DVDRip/HDRIp/BDRip...)',
    'scr': 'Screener',
    'cam': 'Cam',
    'unknown': 'Unknown',
  };

  static final String CSPROVIDERS = providers.keys.where((key) => Settings.getValue<bool>("${Constants.keyProviderPrefix}$key") ?? false).join(',');
  static final String CSLANGUAGES = languages.keys.where((key) => Settings.getValue<bool>("${Constants.keyLanguagePrefix}$key") ?? false).join(',');
  static final String CSQUALITIES = qualities.keys.where((key) => Settings.getValue<bool>("${Constants.keyExcludeQualityPrefix}$key") ?? false).join(',');
  static final String SORTBY = {1: '', 2: 'qualitysize', 3: 'seeders', 4: 'size'}[Settings.getValue<int>(Constants.torrentioSortBy) ?? 1]!;
  static final String SIZELIMIT = Settings.getValue<String>(Constants.torrentioVideoSizeLimit) ?? '';
  static final String NUMBERPERQUALITYLIMIT = Settings.getValue<String>(Constants.torrentioMaxResultsPerQuality) ?? ''; // TODO: validate
}

enum SearchType { movie, tv }

extension SearchTypeExtension on SearchType {
  String get name {
    switch (this) {
      case SearchType.movie:
        return 'movie';
      case SearchType.tv:
        return 'series';
    }
  }
}
