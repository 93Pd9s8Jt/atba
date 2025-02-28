class TorboxAPIResponse {
  final bool success;
  final String? error;
  final String detail;
  final dynamic data;

  TorboxAPIResponse({
    required this.success,
    this.error,
    required this.detail,
    this.data,
  });

  factory TorboxAPIResponse.fromJson(Map<String, dynamic> json) {
    return TorboxAPIResponse(
      success: json['success'],
      error: json['error'],
      detail: json['detail'],
      data: json['data'],
    );
  }

  String get detailOrUnknown => detail.isNotEmpty ? detail : 'Unknown error.';
}
