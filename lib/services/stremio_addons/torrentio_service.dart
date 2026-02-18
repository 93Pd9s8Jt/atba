import 'package:atba/services/stremio_addons/stremio_addon_service.dart';
import '../torrentio_config.dart';

class TorrentioAPI extends StremioAddonAPI {
  TorrentioAPI(super.apiKey);

  @override
  String constructBaseUrl() {
    return 'https://torrentio.strem.fun/providers=${TorrentioConfig.CSPROVIDERS}%7Csort=${TorrentioConfig.SORTBY}%7Clanguage=${TorrentioConfig.CSLANGUAGES}%7Cqualityfilter=${TorrentioConfig.CSQUALITIES}%7climit=${TorrentioConfig.NUMBERPERQUALITYLIMIT}%7Csizefilter=${TorrentioConfig.SIZELIMIT}%7Ctorbox=$apiKey';
  }
}
