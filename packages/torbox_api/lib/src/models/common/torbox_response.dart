import 'package:freezed_annotation/freezed_annotation.dart';

part 'torbox_response.freezed.dart';
part 'torbox_response.g.dart';

/// Normalizes the `error` field of a TorBox API response.
///
/// The API is inconsistent with this field: it is usually `null` or an error
/// code string, but some endpoints return `"null"` as a literal string or a
/// boolean (`false`) instead. Any non-string value is normalized to `null`.
class TorBoxErrorCodeConverter extends JsonConverter<String?, Object?> {
  const TorBoxErrorCodeConverter();

  @override
  String? fromJson(Object? json) {
    if (json is String) {
      final value = json.trim();
      if (value.isEmpty || value == 'null') return null;
      return value;
    }
    return null;
  }

  @override
  Object? toJson(String? value) => value;
}

/// The standard envelope returned by nearly every TorBox API endpoint.
///
/// Use [success] to determine whether a request succeeded, [error] for the
/// machine-readable error code (e.g. `BAD_TOKEN`, `ITEM_NOT_FOUND`), and
/// [detail] for the user-friendly message. [data] carries the typed payload.
///
/// See also:
///
/// * <https://api-docs.torbox.app/> ("Standard Response")
@Freezed(genericArgumentFactories: true)
abstract class TorBoxResponse<T> with _$TorBoxResponse<T> {
  const factory TorBoxResponse({
    required bool success,

    /// Machine-readable error code, or `null` on success.
    @TorBoxErrorCodeConverter() String? error,

    /// User-friendly message, whether success or failure.
    String? detail,

    /// Typed response payload. The exact type depends on the endpoint; it may
    /// be absent (`null`) for operations that return no data.
    T? data,
  }) = _TorBoxResponse<T>;

  factory TorBoxResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) => _$TorBoxResponseFromJson(json, fromJsonT);
}

/// Parses a full API envelope whose `data` carries no typed payload
/// (e.g. control / clear / delete operations).
///
/// Use this when the endpoint contract guarantees `data` is `null`.
/// For endpoints whose `data` shape is undocumented, use
/// [dynamicResponseFromJson] instead so a future payload is preserved
/// rather than silently dropped.
TorBoxResponse<Null> nullResponseFromJson(Map<String, dynamic> json) =>
    TorBoxResponse.fromJson(json, (_) => null);

/// Parses a full API envelope whose `data` shape is undocumented and
/// passed through untouched.
TorBoxResponse<dynamic> dynamicResponseFromJson(Map<String, dynamic> json) =>
    TorBoxResponse.fromJson(json, (data) => data);

/// Parses a full API envelope whose `data` is a plain string
/// (e.g. magnet links, exported file content).
TorBoxResponse<String> stringResponseFromJson(Map<String, dynamic> json) =>
    TorBoxResponse.fromJson(json, (data) => data as String);

/// Parses a full API envelope whose `data` is a download URL.
TorBoxResponse<Uri> uriResponseFromJson(Map<String, dynamic> json) =>
    TorBoxResponse.fromJson(json, (data) => Uri.parse(data as String));
