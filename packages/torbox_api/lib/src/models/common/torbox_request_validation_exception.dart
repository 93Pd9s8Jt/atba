/// Thrown when a request is not valid, before any network call is made.
///
/// A Dart `assert` is removed from a release build, so an invalid request
/// would reach the API during a release run and return an unexpected result
/// instead of an error. This type is used for checks that must run in every
/// build mode.
class TorboxRequestValidationException implements Exception {
  /// A description of the condition that failed, for example
  /// `Either file or magnet must be provided.`.
  final String message;

  /// The argument that failed, for example `file`. Null when the condition
  /// applies to the request as a whole.
  final String? argument;

  TorboxRequestValidationException(this.message, {this.argument});

  @override
  String toString() {
    final buffer = StringBuffer('TorboxRequestValidationException: $message');
    if (argument != null) buffer.write(' (argument: $argument)');
    return buffer.toString();
  }
}
