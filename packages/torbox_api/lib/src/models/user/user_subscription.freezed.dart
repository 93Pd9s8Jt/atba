// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSubscription {

 String? get createdAt; String? get updatedAt; String? get subscriptionCode; String? get emailToken; String? get authId; String? get planCode; String? get status; String? get gateway; String? get planName;
/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSubscriptionCopyWith<UserSubscription> get copyWith => _$UserSubscriptionCopyWithImpl<UserSubscription>(this as UserSubscription, _$identity);

  /// Serializes this UserSubscription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSubscription&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.subscriptionCode, subscriptionCode) || other.subscriptionCode == subscriptionCode)&&(identical(other.emailToken, emailToken) || other.emailToken == emailToken)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.planCode, planCode) || other.planCode == planCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.gateway, gateway) || other.gateway == gateway)&&(identical(other.planName, planName) || other.planName == planName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,updatedAt,subscriptionCode,emailToken,authId,planCode,status,gateway,planName);

@override
String toString() {
  return 'UserSubscription(createdAt: $createdAt, updatedAt: $updatedAt, subscriptionCode: $subscriptionCode, emailToken: $emailToken, authId: $authId, planCode: $planCode, status: $status, gateway: $gateway, planName: $planName)';
}


}

/// @nodoc
abstract mixin class $UserSubscriptionCopyWith<$Res>  {
  factory $UserSubscriptionCopyWith(UserSubscription value, $Res Function(UserSubscription) _then) = _$UserSubscriptionCopyWithImpl;
@useResult
$Res call({
 String? createdAt, String? updatedAt, String? subscriptionCode, String? emailToken, String? authId, String? planCode, String? status, String? gateway, String? planName
});




}
/// @nodoc
class _$UserSubscriptionCopyWithImpl<$Res>
    implements $UserSubscriptionCopyWith<$Res> {
  _$UserSubscriptionCopyWithImpl(this._self, this._then);

  final UserSubscription _self;
  final $Res Function(UserSubscription) _then;

/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = freezed,Object? updatedAt = freezed,Object? subscriptionCode = freezed,Object? emailToken = freezed,Object? authId = freezed,Object? planCode = freezed,Object? status = freezed,Object? gateway = freezed,Object? planName = freezed,}) {
  return _then(_self.copyWith(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,subscriptionCode: freezed == subscriptionCode ? _self.subscriptionCode : subscriptionCode // ignore: cast_nullable_to_non_nullable
as String?,emailToken: freezed == emailToken ? _self.emailToken : emailToken // ignore: cast_nullable_to_non_nullable
as String?,authId: freezed == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String?,planCode: freezed == planCode ? _self.planCode : planCode // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,gateway: freezed == gateway ? _self.gateway : gateway // ignore: cast_nullable_to_non_nullable
as String?,planName: freezed == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSubscription].
extension UserSubscriptionPatterns on UserSubscription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSubscription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSubscription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSubscription value)  $default,){
final _that = this;
switch (_that) {
case _UserSubscription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSubscription value)?  $default,){
final _that = this;
switch (_that) {
case _UserSubscription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? createdAt,  String? updatedAt,  String? subscriptionCode,  String? emailToken,  String? authId,  String? planCode,  String? status,  String? gateway,  String? planName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSubscription() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.subscriptionCode,_that.emailToken,_that.authId,_that.planCode,_that.status,_that.gateway,_that.planName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? createdAt,  String? updatedAt,  String? subscriptionCode,  String? emailToken,  String? authId,  String? planCode,  String? status,  String? gateway,  String? planName)  $default,) {final _that = this;
switch (_that) {
case _UserSubscription():
return $default(_that.createdAt,_that.updatedAt,_that.subscriptionCode,_that.emailToken,_that.authId,_that.planCode,_that.status,_that.gateway,_that.planName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? createdAt,  String? updatedAt,  String? subscriptionCode,  String? emailToken,  String? authId,  String? planCode,  String? status,  String? gateway,  String? planName)?  $default,) {final _that = this;
switch (_that) {
case _UserSubscription() when $default != null:
return $default(_that.createdAt,_that.updatedAt,_that.subscriptionCode,_that.emailToken,_that.authId,_that.planCode,_that.status,_that.gateway,_that.planName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSubscription implements UserSubscription {
  const _UserSubscription({this.createdAt, this.updatedAt, this.subscriptionCode, this.emailToken, this.authId, this.planCode, this.status, this.gateway, this.planName});
  factory _UserSubscription.fromJson(Map<String, dynamic> json) => _$UserSubscriptionFromJson(json);

@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? subscriptionCode;
@override final  String? emailToken;
@override final  String? authId;
@override final  String? planCode;
@override final  String? status;
@override final  String? gateway;
@override final  String? planName;

/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSubscriptionCopyWith<_UserSubscription> get copyWith => __$UserSubscriptionCopyWithImpl<_UserSubscription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSubscriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSubscription&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.subscriptionCode, subscriptionCode) || other.subscriptionCode == subscriptionCode)&&(identical(other.emailToken, emailToken) || other.emailToken == emailToken)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.planCode, planCode) || other.planCode == planCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.gateway, gateway) || other.gateway == gateway)&&(identical(other.planName, planName) || other.planName == planName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,updatedAt,subscriptionCode,emailToken,authId,planCode,status,gateway,planName);

@override
String toString() {
  return 'UserSubscription(createdAt: $createdAt, updatedAt: $updatedAt, subscriptionCode: $subscriptionCode, emailToken: $emailToken, authId: $authId, planCode: $planCode, status: $status, gateway: $gateway, planName: $planName)';
}


}

/// @nodoc
abstract mixin class _$UserSubscriptionCopyWith<$Res> implements $UserSubscriptionCopyWith<$Res> {
  factory _$UserSubscriptionCopyWith(_UserSubscription value, $Res Function(_UserSubscription) _then) = __$UserSubscriptionCopyWithImpl;
@override @useResult
$Res call({
 String? createdAt, String? updatedAt, String? subscriptionCode, String? emailToken, String? authId, String? planCode, String? status, String? gateway, String? planName
});




}
/// @nodoc
class __$UserSubscriptionCopyWithImpl<$Res>
    implements _$UserSubscriptionCopyWith<$Res> {
  __$UserSubscriptionCopyWithImpl(this._self, this._then);

  final _UserSubscription _self;
  final $Res Function(_UserSubscription) _then;

/// Create a copy of UserSubscription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = freezed,Object? updatedAt = freezed,Object? subscriptionCode = freezed,Object? emailToken = freezed,Object? authId = freezed,Object? planCode = freezed,Object? status = freezed,Object? gateway = freezed,Object? planName = freezed,}) {
  return _then(_UserSubscription(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,subscriptionCode: freezed == subscriptionCode ? _self.subscriptionCode : subscriptionCode // ignore: cast_nullable_to_non_nullable
as String?,emailToken: freezed == emailToken ? _self.emailToken : emailToken // ignore: cast_nullable_to_non_nullable
as String?,authId: freezed == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String?,planCode: freezed == planCode ? _self.planCode : planCode // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,gateway: freezed == gateway ? _self.gateway : gateway // ignore: cast_nullable_to_non_nullable
as String?,planName: freezed == planName ? _self.planName : planName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
