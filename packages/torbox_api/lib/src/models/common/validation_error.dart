import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_error.freezed.dart';
part 'validation_error.g.dart';

/// A single validation failure returned by FastAPI (HTTP 422).
@freezed
abstract class ValidationErrorItem with _$ValidationErrorItem {
  const factory ValidationErrorItem({
    /// Location of the failing field, e.g. `["body", "hashes", 0]`.
    required List<Object?> loc,
    required String msg,
    required String type,
    Object? input,
    Map<String, dynamic>? ctx,
  }) = _ValidationErrorItem;

  factory ValidationErrorItem.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorItemFromJson(json);
}

/// The response body of an HTTP 422 Validation Error.
@freezed
abstract class HttpValidationError with _$HttpValidationError {
  const factory HttpValidationError({
    required List<ValidationErrorItem> detail,
  }) = _HttpValidationError;

  factory HttpValidationError.fromJson(Map<String, dynamic> json) =>
      _$HttpValidationErrorFromJson(json);
}
