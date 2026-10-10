import 'package:flutter/foundation.dart';

/// A file attachment for multipart uploads (`.torrent`, `.nzb`).
///
/// Carries raw bytes plus the original filename so uploads work
/// identically on every platform: `dart:io` [File] does not exist on
/// web, but bytes do. Callers read the bytes themselves, e.g.
/// `File(path).readAsBytes()` on native, or `PlatformFile.bytes` from
/// file_picker on web:
///
/// ```dart
/// TorboxFileUpload(filename: picked.name, bytes: picked.bytes!)
/// ```
///
/// All fields are final; instances are immutable.
class TorboxFileUpload {
  /// Original filename, sent as the multipart part filename.
  final String filename;

  /// Raw file content.
  final Uint8List bytes;

  const TorboxFileUpload({required this.filename, required this.bytes});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TorboxFileUpload &&
          other.filename == filename &&
          listEquals(other.bytes, bytes));

  /// Hashed on filename and length only (hashing megabytes on every
  /// lookup would defeat the purpose); equality itself is exact.
  @override
  int get hashCode => Object.hash(filename, bytes.length);
}
