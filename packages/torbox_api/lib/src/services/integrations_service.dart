import '../models/common/torbox_response.dart';
import '../models/integrations/integration_job_data.dart';
import '../net/torbox_client.dart';

/// Integrations service.
///
/// Wraps all `/v1/api/integration/*` endpoints. Accessed via
/// [TorboxApi.integrations].
class IntegrationsService {
  final TorboxClient _client;

  IntegrationsService(this._client);

  /// Queue a transfer to Google Drive.
  Future<TorBoxResponse<dynamic>> addToGoogleDrive({
    required int id,
    int? fileId,
    bool? zip,
    String? type,
    String? googleToken,
  }) => _addToCloud(
    'api/integration/googledrive',
    id: id,
    fileId: fileId,
    zip: zip,
    type: type,
    tokenField: 'google_token',
    token: googleToken,
  );

  /// Queue a transfer to Dropbox.
  Future<TorBoxResponse<dynamic>> addToDropbox({
    required int id,
    int? fileId,
    bool? zip,
    String? type,
    String? dropboxToken,
  }) => _addToCloud(
    'api/integration/dropbox',
    id: id,
    fileId: fileId,
    zip: zip,
    type: type,
    tokenField: 'dropbox_token',
    token: dropboxToken,
  );

  /// Queue a transfer to OneDrive.
  Future<TorBoxResponse<dynamic>> addToOneDrive({
    required int id,
    int? fileId,
    bool? zip,
    String? type,
    String? onedriveToken,
  }) => _addToCloud(
    'api/integration/onedrive',
    id: id,
    fileId: fileId,
    zip: zip,
    type: type,
    tokenField: 'onedrive_token',
    token: onedriveToken,
  );

  /// Queue a transfer to GoFile.
  Future<TorBoxResponse<dynamic>> addToGofile({
    required int id,
    int? fileId,
    bool? zip,
    String? type,
    String? gofileToken,
  }) => _addToCloud(
    'api/integration/gofile',
    id: id,
    fileId: fileId,
    zip: zip,
    type: type,
    tokenField: 'gofile_token',
    token: gofileToken,
  );

  /// Queue a transfer to 1fichier.
  Future<TorBoxResponse<dynamic>> addToOneFichier({
    required int id,
    int? fileId,
    bool? zip,
    String? type,
    String? onefichierToken,
  }) => _addToCloud(
    'api/integration/1fichier',
    id: id,
    fileId: fileId,
    zip: zip,
    type: type,
    tokenField: 'onefichier_token',
    token: onefichierToken,
  );

  /// Queue a transfer to Pixeldrain.
  Future<TorBoxResponse<dynamic>> addToPixeldrain({
    required int id,
    int? fileId,
    bool? zip,
    String? type,
    String? pixeldrainToken,
  }) => _addToCloud(
    'api/integration/pixeldrain',
    id: id,
    fileId: fileId,
    zip: zip,
    type: type,
    tokenField: 'pixeldrain_token',
    token: pixeldrainToken,
  );

  /// The six cloud endpoints take the same fields. Only the token field name
  /// differs, so the body is built in one place.
  Future<TorBoxResponse<dynamic>> _addToCloud(
    String path, {
    required int id,
    int? fileId,
    bool? zip,
    String? type,
    required String tokenField,
    String? token,
  }) async {
    final response = await _client.post(
      path,
      body: {
        'id': id,
        'file_id': fileId,
        'zip': zip,
        'type': type,
        tokenField: token,
      },
    );
    return dynamicResponseFromJson(response);
  }

  /// Get all integration jobs.
  Future<TorBoxResponse<List<IntegrationJobData>>> getAllJobs() async {
    final response = await _client.get('api/integration/jobs');
    return integrationJobListResponseFromJson(response);
  }

  /// Get a specific integration job by ID.
  Future<TorBoxResponse<IntegrationJobData>> getJobById(int jobId) async {
    final response = await _client.get('api/integration/job/$jobId');
    return integrationJobResponseFromJson(response);
  }

  /// Get integration jobs by hash.
  Future<TorBoxResponse<List<IntegrationJobData>>> getJobsByHash(
    String hash,
  ) async {
    final response = await _client.get('api/integration/jobs/$hash');
    return integrationJobListResponseFromJson(response);
  }

  /// Cancel an integration job.
  Future<TorBoxResponse<Null>> cancelJob(int jobId) async {
    final response = await _client.delete('api/integration/job/$jobId');
    return nullResponseFromJson(response);
  }

  /// Update the Discord linked roles for the account.
  Future<TorBoxResponse<dynamic>> linkDiscordRoles({
    required String discordToken,
  }) async {
    final response = await _client.post(
      'api/integration/oauth/discord/linked_roles',
      body: {'discord_token': discordToken},
    );
    return dynamicResponseFromJson(response);
  }

  /// Register an OAuth provider token with the account.
  Future<TorBoxResponse<dynamic>> registerOAuthProvider({
    required String provider,
    required String token,
    required String refreshToken,
  }) async {
    final response = await _client.post(
      'api/integration/oauth/$provider/register',
      body: {'token': token, 'refresh_token': refreshToken},
    );
    return dynamicResponseFromJson(response);
  }
}
