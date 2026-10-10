// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferralData _$ReferralDataFromJson(Map<String, dynamic> json) =>
    _ReferralData(
      referredAccounts: (json['referred_accounts'] as num).toInt(),
      referralCode: json['referral_code'] as String,
      purchasesReferred: (json['purchases_referred'] as num).toInt(),
    );

Map<String, dynamic> _$ReferralDataToJson(_ReferralData instance) =>
    <String, dynamic>{
      'referred_accounts': instance.referredAccounts,
      'referral_code': instance.referralCode,
      'purchases_referred': instance.purchasesReferred,
    };
