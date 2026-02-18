import 'package:atba/services/stremio_addons/stremio_addon_service.dart';

class TorboxAddonAPI extends StremioAddonAPI {
  TorboxAddonAPI(super.apiKey);

  @override
  String constructBaseUrl() {
    return 'https://stremio.torbox.app/$apiKey';
  }
}
