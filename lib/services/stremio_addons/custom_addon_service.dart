import 'package:atba/services/stremio_addons/stremio_addon_service.dart';

class CustomAddonAPI extends StremioAddonAPI {
  CustomAddonAPI(this.manifestUrl) : super(null);
  String manifestUrl;

  @override
  String constructBaseUrl() {
    return manifestUrl.replaceFirst(RegExp(r'/manifest.json$'), "");
  }
}
