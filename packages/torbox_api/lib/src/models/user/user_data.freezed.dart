// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserData {

 int get id; String get authId; String? get createdAt; String? get updatedAt;/// Plan tier identifier (0 = free).
 int? get plan; int? get totalDownloaded; String? get customer; bool? get isSubscribed;/// ISO-8601 timestamp of when premium expires.
 String? get premiumExpiresAt;/// ISO-8601 timestamp of when a cooldown ends.
 String? get cooldownUntil; String? get email; String? get userReferral; String? get baseEmail; int? get totalBytesDownloaded; int? get totalBytesUploaded; int? get torrentsDownloaded; int? get webDownloadsDownloaded; int? get usenetDownloadsDownloaded; int? get additionalConcurrentSlots; bool? get longTermSeeding; bool? get longTermStorage; bool? get isVendor; int? get vendorId; int? get purchasesReferred; UserSettings? get settings;
/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDataCopyWith<UserData> get copyWith => _$UserDataCopyWithImpl<UserData>(this as UserData, _$identity);

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserData&&(identical(other.id, id) || other.id == id)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.totalDownloaded, totalDownloaded) || other.totalDownloaded == totalDownloaded)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&(identical(other.premiumExpiresAt, premiumExpiresAt) || other.premiumExpiresAt == premiumExpiresAt)&&(identical(other.cooldownUntil, cooldownUntil) || other.cooldownUntil == cooldownUntil)&&(identical(other.email, email) || other.email == email)&&(identical(other.userReferral, userReferral) || other.userReferral == userReferral)&&(identical(other.baseEmail, baseEmail) || other.baseEmail == baseEmail)&&(identical(other.totalBytesDownloaded, totalBytesDownloaded) || other.totalBytesDownloaded == totalBytesDownloaded)&&(identical(other.totalBytesUploaded, totalBytesUploaded) || other.totalBytesUploaded == totalBytesUploaded)&&(identical(other.torrentsDownloaded, torrentsDownloaded) || other.torrentsDownloaded == torrentsDownloaded)&&(identical(other.webDownloadsDownloaded, webDownloadsDownloaded) || other.webDownloadsDownloaded == webDownloadsDownloaded)&&(identical(other.usenetDownloadsDownloaded, usenetDownloadsDownloaded) || other.usenetDownloadsDownloaded == usenetDownloadsDownloaded)&&(identical(other.additionalConcurrentSlots, additionalConcurrentSlots) || other.additionalConcurrentSlots == additionalConcurrentSlots)&&(identical(other.longTermSeeding, longTermSeeding) || other.longTermSeeding == longTermSeeding)&&(identical(other.longTermStorage, longTermStorage) || other.longTermStorage == longTermStorage)&&(identical(other.isVendor, isVendor) || other.isVendor == isVendor)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.purchasesReferred, purchasesReferred) || other.purchasesReferred == purchasesReferred)&&(identical(other.settings, settings) || other.settings == settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,authId,createdAt,updatedAt,plan,totalDownloaded,customer,isSubscribed,premiumExpiresAt,cooldownUntil,email,userReferral,baseEmail,totalBytesDownloaded,totalBytesUploaded,torrentsDownloaded,webDownloadsDownloaded,usenetDownloadsDownloaded,additionalConcurrentSlots,longTermSeeding,longTermStorage,isVendor,vendorId,purchasesReferred,settings]);

@override
String toString() {
  return 'UserData(id: $id, authId: $authId, createdAt: $createdAt, updatedAt: $updatedAt, plan: $plan, totalDownloaded: $totalDownloaded, customer: $customer, isSubscribed: $isSubscribed, premiumExpiresAt: $premiumExpiresAt, cooldownUntil: $cooldownUntil, email: $email, userReferral: $userReferral, baseEmail: $baseEmail, totalBytesDownloaded: $totalBytesDownloaded, totalBytesUploaded: $totalBytesUploaded, torrentsDownloaded: $torrentsDownloaded, webDownloadsDownloaded: $webDownloadsDownloaded, usenetDownloadsDownloaded: $usenetDownloadsDownloaded, additionalConcurrentSlots: $additionalConcurrentSlots, longTermSeeding: $longTermSeeding, longTermStorage: $longTermStorage, isVendor: $isVendor, vendorId: $vendorId, purchasesReferred: $purchasesReferred, settings: $settings)';
}


}

/// @nodoc
abstract mixin class $UserDataCopyWith<$Res>  {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) _then) = _$UserDataCopyWithImpl;
@useResult
$Res call({
 int id, String authId, String? createdAt, String? updatedAt, int? plan, int? totalDownloaded, String? customer, bool? isSubscribed, String? premiumExpiresAt, String? cooldownUntil, String? email, String? userReferral, String? baseEmail, int? totalBytesDownloaded, int? totalBytesUploaded, int? torrentsDownloaded, int? webDownloadsDownloaded, int? usenetDownloadsDownloaded, int? additionalConcurrentSlots, bool? longTermSeeding, bool? longTermStorage, bool? isVendor, int? vendorId, int? purchasesReferred, UserSettings? settings
});


$UserSettingsCopyWith<$Res>? get settings;

}
/// @nodoc
class _$UserDataCopyWithImpl<$Res>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._self, this._then);

  final UserData _self;
  final $Res Function(UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authId = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? plan = freezed,Object? totalDownloaded = freezed,Object? customer = freezed,Object? isSubscribed = freezed,Object? premiumExpiresAt = freezed,Object? cooldownUntil = freezed,Object? email = freezed,Object? userReferral = freezed,Object? baseEmail = freezed,Object? totalBytesDownloaded = freezed,Object? totalBytesUploaded = freezed,Object? torrentsDownloaded = freezed,Object? webDownloadsDownloaded = freezed,Object? usenetDownloadsDownloaded = freezed,Object? additionalConcurrentSlots = freezed,Object? longTermSeeding = freezed,Object? longTermStorage = freezed,Object? isVendor = freezed,Object? vendorId = freezed,Object? purchasesReferred = freezed,Object? settings = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as int?,totalDownloaded: freezed == totalDownloaded ? _self.totalDownloaded : totalDownloaded // ignore: cast_nullable_to_non_nullable
as int?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String?,isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,premiumExpiresAt: freezed == premiumExpiresAt ? _self.premiumExpiresAt : premiumExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,cooldownUntil: freezed == cooldownUntil ? _self.cooldownUntil : cooldownUntil // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,userReferral: freezed == userReferral ? _self.userReferral : userReferral // ignore: cast_nullable_to_non_nullable
as String?,baseEmail: freezed == baseEmail ? _self.baseEmail : baseEmail // ignore: cast_nullable_to_non_nullable
as String?,totalBytesDownloaded: freezed == totalBytesDownloaded ? _self.totalBytesDownloaded : totalBytesDownloaded // ignore: cast_nullable_to_non_nullable
as int?,totalBytesUploaded: freezed == totalBytesUploaded ? _self.totalBytesUploaded : totalBytesUploaded // ignore: cast_nullable_to_non_nullable
as int?,torrentsDownloaded: freezed == torrentsDownloaded ? _self.torrentsDownloaded : torrentsDownloaded // ignore: cast_nullable_to_non_nullable
as int?,webDownloadsDownloaded: freezed == webDownloadsDownloaded ? _self.webDownloadsDownloaded : webDownloadsDownloaded // ignore: cast_nullable_to_non_nullable
as int?,usenetDownloadsDownloaded: freezed == usenetDownloadsDownloaded ? _self.usenetDownloadsDownloaded : usenetDownloadsDownloaded // ignore: cast_nullable_to_non_nullable
as int?,additionalConcurrentSlots: freezed == additionalConcurrentSlots ? _self.additionalConcurrentSlots : additionalConcurrentSlots // ignore: cast_nullable_to_non_nullable
as int?,longTermSeeding: freezed == longTermSeeding ? _self.longTermSeeding : longTermSeeding // ignore: cast_nullable_to_non_nullable
as bool?,longTermStorage: freezed == longTermStorage ? _self.longTermStorage : longTermStorage // ignore: cast_nullable_to_non_nullable
as bool?,isVendor: freezed == isVendor ? _self.isVendor : isVendor // ignore: cast_nullable_to_non_nullable
as bool?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as int?,purchasesReferred: freezed == purchasesReferred ? _self.purchasesReferred : purchasesReferred // ignore: cast_nullable_to_non_nullable
as int?,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as UserSettings?,
  ));
}
/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $UserSettingsCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserData].
extension UserDataPatterns on UserData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserData value)  $default,){
final _that = this;
switch (_that) {
case _UserData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserData value)?  $default,){
final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String authId,  String? createdAt,  String? updatedAt,  int? plan,  int? totalDownloaded,  String? customer,  bool? isSubscribed,  String? premiumExpiresAt,  String? cooldownUntil,  String? email,  String? userReferral,  String? baseEmail,  int? totalBytesDownloaded,  int? totalBytesUploaded,  int? torrentsDownloaded,  int? webDownloadsDownloaded,  int? usenetDownloadsDownloaded,  int? additionalConcurrentSlots,  bool? longTermSeeding,  bool? longTermStorage,  bool? isVendor,  int? vendorId,  int? purchasesReferred,  UserSettings? settings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.id,_that.authId,_that.createdAt,_that.updatedAt,_that.plan,_that.totalDownloaded,_that.customer,_that.isSubscribed,_that.premiumExpiresAt,_that.cooldownUntil,_that.email,_that.userReferral,_that.baseEmail,_that.totalBytesDownloaded,_that.totalBytesUploaded,_that.torrentsDownloaded,_that.webDownloadsDownloaded,_that.usenetDownloadsDownloaded,_that.additionalConcurrentSlots,_that.longTermSeeding,_that.longTermStorage,_that.isVendor,_that.vendorId,_that.purchasesReferred,_that.settings);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String authId,  String? createdAt,  String? updatedAt,  int? plan,  int? totalDownloaded,  String? customer,  bool? isSubscribed,  String? premiumExpiresAt,  String? cooldownUntil,  String? email,  String? userReferral,  String? baseEmail,  int? totalBytesDownloaded,  int? totalBytesUploaded,  int? torrentsDownloaded,  int? webDownloadsDownloaded,  int? usenetDownloadsDownloaded,  int? additionalConcurrentSlots,  bool? longTermSeeding,  bool? longTermStorage,  bool? isVendor,  int? vendorId,  int? purchasesReferred,  UserSettings? settings)  $default,) {final _that = this;
switch (_that) {
case _UserData():
return $default(_that.id,_that.authId,_that.createdAt,_that.updatedAt,_that.plan,_that.totalDownloaded,_that.customer,_that.isSubscribed,_that.premiumExpiresAt,_that.cooldownUntil,_that.email,_that.userReferral,_that.baseEmail,_that.totalBytesDownloaded,_that.totalBytesUploaded,_that.torrentsDownloaded,_that.webDownloadsDownloaded,_that.usenetDownloadsDownloaded,_that.additionalConcurrentSlots,_that.longTermSeeding,_that.longTermStorage,_that.isVendor,_that.vendorId,_that.purchasesReferred,_that.settings);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String authId,  String? createdAt,  String? updatedAt,  int? plan,  int? totalDownloaded,  String? customer,  bool? isSubscribed,  String? premiumExpiresAt,  String? cooldownUntil,  String? email,  String? userReferral,  String? baseEmail,  int? totalBytesDownloaded,  int? totalBytesUploaded,  int? torrentsDownloaded,  int? webDownloadsDownloaded,  int? usenetDownloadsDownloaded,  int? additionalConcurrentSlots,  bool? longTermSeeding,  bool? longTermStorage,  bool? isVendor,  int? vendorId,  int? purchasesReferred,  UserSettings? settings)?  $default,) {final _that = this;
switch (_that) {
case _UserData() when $default != null:
return $default(_that.id,_that.authId,_that.createdAt,_that.updatedAt,_that.plan,_that.totalDownloaded,_that.customer,_that.isSubscribed,_that.premiumExpiresAt,_that.cooldownUntil,_that.email,_that.userReferral,_that.baseEmail,_that.totalBytesDownloaded,_that.totalBytesUploaded,_that.torrentsDownloaded,_that.webDownloadsDownloaded,_that.usenetDownloadsDownloaded,_that.additionalConcurrentSlots,_that.longTermSeeding,_that.longTermStorage,_that.isVendor,_that.vendorId,_that.purchasesReferred,_that.settings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserData implements UserData {
  const _UserData({required this.id, required this.authId, this.createdAt, this.updatedAt, this.plan, this.totalDownloaded, this.customer, this.isSubscribed, this.premiumExpiresAt, this.cooldownUntil, this.email, this.userReferral, this.baseEmail, this.totalBytesDownloaded, this.totalBytesUploaded, this.torrentsDownloaded, this.webDownloadsDownloaded, this.usenetDownloadsDownloaded, this.additionalConcurrentSlots, this.longTermSeeding, this.longTermStorage, this.isVendor, this.vendorId, this.purchasesReferred, this.settings});
  factory _UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

@override final  int id;
@override final  String authId;
@override final  String? createdAt;
@override final  String? updatedAt;
/// Plan tier identifier (0 = free).
@override final  int? plan;
@override final  int? totalDownloaded;
@override final  String? customer;
@override final  bool? isSubscribed;
/// ISO-8601 timestamp of when premium expires.
@override final  String? premiumExpiresAt;
/// ISO-8601 timestamp of when a cooldown ends.
@override final  String? cooldownUntil;
@override final  String? email;
@override final  String? userReferral;
@override final  String? baseEmail;
@override final  int? totalBytesDownloaded;
@override final  int? totalBytesUploaded;
@override final  int? torrentsDownloaded;
@override final  int? webDownloadsDownloaded;
@override final  int? usenetDownloadsDownloaded;
@override final  int? additionalConcurrentSlots;
@override final  bool? longTermSeeding;
@override final  bool? longTermStorage;
@override final  bool? isVendor;
@override final  int? vendorId;
@override final  int? purchasesReferred;
@override final  UserSettings? settings;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDataCopyWith<_UserData> get copyWith => __$UserDataCopyWithImpl<_UserData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserData&&(identical(other.id, id) || other.id == id)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.totalDownloaded, totalDownloaded) || other.totalDownloaded == totalDownloaded)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&(identical(other.premiumExpiresAt, premiumExpiresAt) || other.premiumExpiresAt == premiumExpiresAt)&&(identical(other.cooldownUntil, cooldownUntil) || other.cooldownUntil == cooldownUntil)&&(identical(other.email, email) || other.email == email)&&(identical(other.userReferral, userReferral) || other.userReferral == userReferral)&&(identical(other.baseEmail, baseEmail) || other.baseEmail == baseEmail)&&(identical(other.totalBytesDownloaded, totalBytesDownloaded) || other.totalBytesDownloaded == totalBytesDownloaded)&&(identical(other.totalBytesUploaded, totalBytesUploaded) || other.totalBytesUploaded == totalBytesUploaded)&&(identical(other.torrentsDownloaded, torrentsDownloaded) || other.torrentsDownloaded == torrentsDownloaded)&&(identical(other.webDownloadsDownloaded, webDownloadsDownloaded) || other.webDownloadsDownloaded == webDownloadsDownloaded)&&(identical(other.usenetDownloadsDownloaded, usenetDownloadsDownloaded) || other.usenetDownloadsDownloaded == usenetDownloadsDownloaded)&&(identical(other.additionalConcurrentSlots, additionalConcurrentSlots) || other.additionalConcurrentSlots == additionalConcurrentSlots)&&(identical(other.longTermSeeding, longTermSeeding) || other.longTermSeeding == longTermSeeding)&&(identical(other.longTermStorage, longTermStorage) || other.longTermStorage == longTermStorage)&&(identical(other.isVendor, isVendor) || other.isVendor == isVendor)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.purchasesReferred, purchasesReferred) || other.purchasesReferred == purchasesReferred)&&(identical(other.settings, settings) || other.settings == settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,authId,createdAt,updatedAt,plan,totalDownloaded,customer,isSubscribed,premiumExpiresAt,cooldownUntil,email,userReferral,baseEmail,totalBytesDownloaded,totalBytesUploaded,torrentsDownloaded,webDownloadsDownloaded,usenetDownloadsDownloaded,additionalConcurrentSlots,longTermSeeding,longTermStorage,isVendor,vendorId,purchasesReferred,settings]);

@override
String toString() {
  return 'UserData(id: $id, authId: $authId, createdAt: $createdAt, updatedAt: $updatedAt, plan: $plan, totalDownloaded: $totalDownloaded, customer: $customer, isSubscribed: $isSubscribed, premiumExpiresAt: $premiumExpiresAt, cooldownUntil: $cooldownUntil, email: $email, userReferral: $userReferral, baseEmail: $baseEmail, totalBytesDownloaded: $totalBytesDownloaded, totalBytesUploaded: $totalBytesUploaded, torrentsDownloaded: $torrentsDownloaded, webDownloadsDownloaded: $webDownloadsDownloaded, usenetDownloadsDownloaded: $usenetDownloadsDownloaded, additionalConcurrentSlots: $additionalConcurrentSlots, longTermSeeding: $longTermSeeding, longTermStorage: $longTermStorage, isVendor: $isVendor, vendorId: $vendorId, purchasesReferred: $purchasesReferred, settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$UserDataCopyWith(_UserData value, $Res Function(_UserData) _then) = __$UserDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String authId, String? createdAt, String? updatedAt, int? plan, int? totalDownloaded, String? customer, bool? isSubscribed, String? premiumExpiresAt, String? cooldownUntil, String? email, String? userReferral, String? baseEmail, int? totalBytesDownloaded, int? totalBytesUploaded, int? torrentsDownloaded, int? webDownloadsDownloaded, int? usenetDownloadsDownloaded, int? additionalConcurrentSlots, bool? longTermSeeding, bool? longTermStorage, bool? isVendor, int? vendorId, int? purchasesReferred, UserSettings? settings
});


@override $UserSettingsCopyWith<$Res>? get settings;

}
/// @nodoc
class __$UserDataCopyWithImpl<$Res>
    implements _$UserDataCopyWith<$Res> {
  __$UserDataCopyWithImpl(this._self, this._then);

  final _UserData _self;
  final $Res Function(_UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authId = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? plan = freezed,Object? totalDownloaded = freezed,Object? customer = freezed,Object? isSubscribed = freezed,Object? premiumExpiresAt = freezed,Object? cooldownUntil = freezed,Object? email = freezed,Object? userReferral = freezed,Object? baseEmail = freezed,Object? totalBytesDownloaded = freezed,Object? totalBytesUploaded = freezed,Object? torrentsDownloaded = freezed,Object? webDownloadsDownloaded = freezed,Object? usenetDownloadsDownloaded = freezed,Object? additionalConcurrentSlots = freezed,Object? longTermSeeding = freezed,Object? longTermStorage = freezed,Object? isVendor = freezed,Object? vendorId = freezed,Object? purchasesReferred = freezed,Object? settings = freezed,}) {
  return _then(_UserData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as int?,totalDownloaded: freezed == totalDownloaded ? _self.totalDownloaded : totalDownloaded // ignore: cast_nullable_to_non_nullable
as int?,customer: freezed == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String?,isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,premiumExpiresAt: freezed == premiumExpiresAt ? _self.premiumExpiresAt : premiumExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,cooldownUntil: freezed == cooldownUntil ? _self.cooldownUntil : cooldownUntil // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,userReferral: freezed == userReferral ? _self.userReferral : userReferral // ignore: cast_nullable_to_non_nullable
as String?,baseEmail: freezed == baseEmail ? _self.baseEmail : baseEmail // ignore: cast_nullable_to_non_nullable
as String?,totalBytesDownloaded: freezed == totalBytesDownloaded ? _self.totalBytesDownloaded : totalBytesDownloaded // ignore: cast_nullable_to_non_nullable
as int?,totalBytesUploaded: freezed == totalBytesUploaded ? _self.totalBytesUploaded : totalBytesUploaded // ignore: cast_nullable_to_non_nullable
as int?,torrentsDownloaded: freezed == torrentsDownloaded ? _self.torrentsDownloaded : torrentsDownloaded // ignore: cast_nullable_to_non_nullable
as int?,webDownloadsDownloaded: freezed == webDownloadsDownloaded ? _self.webDownloadsDownloaded : webDownloadsDownloaded // ignore: cast_nullable_to_non_nullable
as int?,usenetDownloadsDownloaded: freezed == usenetDownloadsDownloaded ? _self.usenetDownloadsDownloaded : usenetDownloadsDownloaded // ignore: cast_nullable_to_non_nullable
as int?,additionalConcurrentSlots: freezed == additionalConcurrentSlots ? _self.additionalConcurrentSlots : additionalConcurrentSlots // ignore: cast_nullable_to_non_nullable
as int?,longTermSeeding: freezed == longTermSeeding ? _self.longTermSeeding : longTermSeeding // ignore: cast_nullable_to_non_nullable
as bool?,longTermStorage: freezed == longTermStorage ? _self.longTermStorage : longTermStorage // ignore: cast_nullable_to_non_nullable
as bool?,isVendor: freezed == isVendor ? _self.isVendor : isVendor // ignore: cast_nullable_to_non_nullable
as bool?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as int?,purchasesReferred: freezed == purchasesReferred ? _self.purchasesReferred : purchasesReferred // ignore: cast_nullable_to_non_nullable
as int?,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as UserSettings?,
  ));
}

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $UserSettingsCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

// dart format on
