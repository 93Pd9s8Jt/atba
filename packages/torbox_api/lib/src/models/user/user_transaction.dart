import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/torbox_response.dart';

part 'user_transaction.freezed.dart';
part 'user_transaction.g.dart';

/// A past payment returned by `GET /v1/api/user/transactions`.
@freezed
abstract class UserTransaction with _$UserTransaction {
  const factory UserTransaction({
    required String at,
    required String type,
    required int amount,
    required String transactionId,
  }) = _UserTransaction;

  factory UserTransaction.fromJson(Map<String, dynamic> json) =>
      _$UserTransactionFromJson(json);
}

/// Parses a full API envelope for `GET /v1/api/user/transactions`, whose
/// `data` is a list of transactions.
TorBoxResponse<List<UserTransaction>> userTransactionListResponseFromJson(
  Map<String, dynamic> json,
) => TorBoxResponse.fromJson(
  json,
  (data) => (data as List<dynamic>)
      .map((e) => UserTransaction.fromJson(e as Map<String, dynamic>))
      .toList(),
);
