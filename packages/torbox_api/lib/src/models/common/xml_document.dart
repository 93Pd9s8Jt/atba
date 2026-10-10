/// A raw XML payload returned by the TorBox RSS endpoints.
///
/// Unlike the JSON endpoints, these answer with an XML document rather than
/// the standard `{success, error, detail, data}` envelope, so there is no
/// `data` field to deserialize. This type gives that payload a name (and
/// therefore a return type in the API surface) without pretending to be a
/// parsed feed — no XML parser is involved.
///
/// Callers that want structure should parse [xml] themselves, or this type
/// can grow typed accessors if a real need for them appears.
class XmlDocument {
  /// The raw XML text as returned by the API.
  final String xml;

  const XmlDocument(this.xml);

  @override
  String toString() => xml;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is XmlDocument && other.xml == xml);

  @override
  int get hashCode => xml.hashCode;
}
