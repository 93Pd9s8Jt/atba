// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserTransaction _$UserTransactionFromJson(Map<String, dynamic> json) =>
    _UserTransaction(
      at: json['at'] as String,
      type: json['type'] as String,
      amount: (json['amount'] as num).toInt(),
      transactionId: json['transaction_id'] as String,
    );

Map<String, dynamic> _$UserTransactionToJson(_UserTransaction instance) =>
    <String, dynamic>{
      'at': instance.at,
      'type': instance.type,
      'amount': instance.amount,
      'transaction_id': instance.transactionId,
    };
