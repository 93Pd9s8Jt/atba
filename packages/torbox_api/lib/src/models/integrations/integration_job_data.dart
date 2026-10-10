import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'integration_job_data.freezed.dart';
part 'integration_job_data.g.dart';

/// A cloud-provider transfer job returned by the integration job endpoints
/// (`/v1/api/integration/jobs`, `/v1/api/integration/job/{job_id}` and
/// `/v1/api/integration/jobs/{hash}`).
@freezed
abstract class IntegrationJobData with _$IntegrationJobData {
  const factory IntegrationJobData({
    required int id,
    required String createdAt,
    required String updatedAt,
    required String authId,
    required String hash,
    required String type,
    required String integration,
    int? fileId,
    required bool zip,
    required double progress,
    required String detail,

    /// Populated once the transfer completes.
    String? downloadUrl,
    required String status,
    required String fileName,

    /// Returned by the list endpoints.
    @JsonKey(name: 'task_id') String? taskId,

    /// Returned by the single-job endpoint.
    @JsonKey(name: 'job_id') String? jobId,
  }) = _IntegrationJobData;

  factory IntegrationJobData.fromJson(Map<String, dynamic> json) =>
      _$IntegrationJobDataFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/integration/job/{job_id}`.
TorBoxResponse<IntegrationJobData> integrationJobResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => IntegrationJobData.fromJson(data as Map<String, dynamic>),
);

/// Parses a full API envelope for `GET /v1/api/integration/jobs` and
/// `GET /v1/api/integration/jobs/{hash}`, whose `data` is a list of jobs.
TorBoxResponse<List<IntegrationJobData>> integrationJobListResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => (data as List<dynamic>)
      .map((e) => IntegrationJobData.fromJson(e as Map<String, dynamic>))
      .toList(),
);
