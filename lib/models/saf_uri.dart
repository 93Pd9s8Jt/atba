class SafUriInfo {
  final String authority;
  final String? treeId;
  final String? documentId;
  final String? volume;
  final String? relativePath;

  SafUriInfo({
    required this.authority,
    this.treeId,
    this.documentId,
    this.volume,
    this.relativePath,
  });

  static SafUriInfo? tryParseUri(String uriString) {
    final uri = Uri.tryParse(uriString);
    if (uri?.scheme == "content") {
      return SafUriInfo.parseSafUri(uriString);
    } else {
      return null;
    }
  }

  factory SafUriInfo.parseSafUri(String uriString) {
    final uri = Uri.tryParse(uriString);
    assert(uri?.scheme == "content", "Invalid uri.");
    final segments = uri!.pathSegments;

    String? treeId;
    String? documentId;

    for (int i = 0; i < segments.length; i++) {
      if (segments[i] == 'tree' && i + 1 < segments.length) {
        treeId = Uri.decodeComponent(segments[i + 1]);
      }
      if (segments[i] == 'document' && i + 1 < segments.length) {
        documentId = Uri.decodeComponent(segments[i + 1]);
      }
    }

    String? volume;
    String? relativePath;

    if (documentId != null) {
      final parts = documentId.split(':');
      volume = parts[0];
      relativePath = parts.length > 1 ? parts[1] : '';
    }

    return SafUriInfo(
      authority: uri.authority,
      treeId: treeId,
      documentId: documentId,
      volume: volume,
      relativePath: relativePath,
    );
  }
}
