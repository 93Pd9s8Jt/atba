// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSubscription _$UserSubscriptionFromJson(Map<String, dynamic> json) =>
    _UserSubscription(
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      subscriptionCode: json['subscription_code'] as String?,
      emailToken: json['email_token'] as String?,
      authId: json['auth_id'] as String?,
      planCode: json['plan_code'] as String?,
      status: json['status'] as String?,
      gateway: json['gateway'] as String?,
      planName: json['plan_name'] as String?,
    );

Map<String, dynamic> _$UserSubscriptionToJson(_UserSubscription instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'subscription_code': instance.subscriptionCode,
      'email_token': instance.emailToken,
      'auth_id': instance.authId,
      'plan_code': instance.planCode,
      'status': instance.status,
      'gateway': instance.gateway,
      'plan_name': instance.planName,
    };
