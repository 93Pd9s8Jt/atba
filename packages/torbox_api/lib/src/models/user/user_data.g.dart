// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
  id: (json['id'] as num).toInt(),
  authId: json['auth_id'] as String,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  plan: (json['plan'] as num?)?.toInt(),
  totalDownloaded: (json['total_downloaded'] as num?)?.toInt(),
  customer: json['customer'] as String?,
  isSubscribed: json['is_subscribed'] as bool?,
  premiumExpiresAt: json['premium_expires_at'] as String?,
  cooldownUntil: json['cooldown_until'] as String?,
  email: json['email'] as String?,
  userReferral: json['user_referral'] as String?,
  baseEmail: json['base_email'] as String?,
  totalBytesDownloaded: (json['total_bytes_downloaded'] as num?)?.toInt(),
  totalBytesUploaded: (json['total_bytes_uploaded'] as num?)?.toInt(),
  torrentsDownloaded: (json['torrents_downloaded'] as num?)?.toInt(),
  webDownloadsDownloaded: (json['web_downloads_downloaded'] as num?)?.toInt(),
  usenetDownloadsDownloaded: (json['usenet_downloads_downloaded'] as num?)
      ?.toInt(),
  additionalConcurrentSlots: (json['additional_concurrent_slots'] as num?)
      ?.toInt(),
  longTermSeeding: json['long_term_seeding'] as bool?,
  longTermStorage: json['long_term_storage'] as bool?,
  isVendor: json['is_vendor'] as bool?,
  vendorId: (json['vendor_id'] as num?)?.toInt(),
  purchasesReferred: (json['purchases_referred'] as num?)?.toInt(),
  settings: json['settings'] == null
      ? null
      : UserSettings.fromJson(json['settings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
  'id': instance.id,
  'auth_id': instance.authId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'plan': instance.plan,
  'total_downloaded': instance.totalDownloaded,
  'customer': instance.customer,
  'is_subscribed': instance.isSubscribed,
  'premium_expires_at': instance.premiumExpiresAt,
  'cooldown_until': instance.cooldownUntil,
  'email': instance.email,
  'user_referral': instance.userReferral,
  'base_email': instance.baseEmail,
  'total_bytes_downloaded': instance.totalBytesDownloaded,
  'total_bytes_uploaded': instance.totalBytesUploaded,
  'torrents_downloaded': instance.torrentsDownloaded,
  'web_downloads_downloaded': instance.webDownloadsDownloaded,
  'usenet_downloads_downloaded': instance.usenetDownloadsDownloaded,
  'additional_concurrent_slots': instance.additionalConcurrentSlots,
  'long_term_seeding': instance.longTermSeeding,
  'long_term_storage': instance.longTermStorage,
  'is_vendor': instance.isVendor,
  'vendor_id': instance.vendorId,
  'purchases_referred': instance.purchasesReferred,
  'settings': instance.settings?.toJson(),
};
