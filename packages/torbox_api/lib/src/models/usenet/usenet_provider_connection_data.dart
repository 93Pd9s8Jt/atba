import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'usenet_provider_connection_data.freezed.dart';
part 'usenet_provider_connection_data.g.dart';

/// TorBox Usenet provider connection information, returned by
/// `GET /v1/api/usenet/provider/connection`.
@freezed
abstract class UsenetProviderConnectionData
    with _$UsenetProviderConnectionData {
  const factory UsenetProviderConnectionData({
    required String host,
    required int port,
    required bool ssl,
    required String username,
    required String password,
    required int connections,
    required int retention,
    required String limitations,
  }) = _UsenetProviderConnectionData;

  factory UsenetProviderConnectionData.fromJson(Map<String, dynamic> json) =>
      _$UsenetProviderConnectionDataFromJson(json);
}

/// Parses a full API envelope for
/// `GET /v1/api/usenet/provider/connection`.
TorBoxResponse<UsenetProviderConnectionData>
usenetProviderConnectionResponseFromJson(Map<String, dynamic> json) =>
    TorBoxResponse.fromJson(
      json,
      (data) =>
          UsenetProviderConnectionData.fromJson(data as Map<String, dynamic>),
    );
