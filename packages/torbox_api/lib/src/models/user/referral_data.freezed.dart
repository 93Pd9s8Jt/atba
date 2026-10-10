// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferralData {

 int get referredAccounts; String get referralCode; int get purchasesReferred;
/// Create a copy of ReferralData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralDataCopyWith<ReferralData> get copyWith => _$ReferralDataCopyWithImpl<ReferralData>(this as ReferralData, _$identity);

  /// Serializes this ReferralData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralData&&(identical(other.referredAccounts, referredAccounts) || other.referredAccounts == referredAccounts)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.purchasesReferred, purchasesReferred) || other.purchasesReferred == purchasesReferred));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,referredAccounts,referralCode,purchasesReferred);

@override
String toString() {
  return 'ReferralData(referredAccounts: $referredAccounts, referralCode: $referralCode, purchasesReferred: $purchasesReferred)';
}


}

/// @nodoc
abstract mixin class $ReferralDataCopyWith<$Res>  {
  factory $ReferralDataCopyWith(ReferralData value, $Res Function(ReferralData) _then) = _$ReferralDataCopyWithImpl;
@useResult
$Res call({
 int referredAccounts, String referralCode, int purchasesReferred
});




}
/// @nodoc
class _$ReferralDataCopyWithImpl<$Res>
    implements $ReferralDataCopyWith<$Res> {
  _$ReferralDataCopyWithImpl(this._self, this._then);

  final ReferralData _self;
  final $Res Function(ReferralData) _then;

/// Create a copy of ReferralData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? referredAccounts = null,Object? referralCode = null,Object? purchasesReferred = null,}) {
  return _then(_self.copyWith(
referredAccounts: null == referredAccounts ? _self.referredAccounts : referredAccounts // ignore: cast_nullable_to_non_nullable
as int,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,purchasesReferred: null == purchasesReferred ? _self.purchasesReferred : purchasesReferred // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferralData].
extension ReferralDataPatterns on ReferralData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralData value)  $default,){
final _that = this;
switch (_that) {
case _ReferralData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralData value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int referredAccounts,  String referralCode,  int purchasesReferred)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralData() when $default != null:
return $default(_that.referredAccounts,_that.referralCode,_that.purchasesReferred);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int referredAccounts,  String referralCode,  int purchasesReferred)  $default,) {final _that = this;
switch (_that) {
case _ReferralData():
return $default(_that.referredAccounts,_that.referralCode,_that.purchasesReferred);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int referredAccounts,  String referralCode,  int purchasesReferred)?  $default,) {final _that = this;
switch (_that) {
case _ReferralData() when $default != null:
return $default(_that.referredAccounts,_that.referralCode,_that.purchasesReferred);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralData implements ReferralData {
  const _ReferralData({required this.referredAccounts, required this.referralCode, required this.purchasesReferred});
  factory _ReferralData.fromJson(Map<String, dynamic> json) => _$ReferralDataFromJson(json);

@override final  int referredAccounts;
@override final  String referralCode;
@override final  int purchasesReferred;

/// Create a copy of ReferralData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralDataCopyWith<_ReferralData> get copyWith => __$ReferralDataCopyWithImpl<_ReferralData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralData&&(identical(other.referredAccounts, referredAccounts) || other.referredAccounts == referredAccounts)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.purchasesReferred, purchasesReferred) || other.purchasesReferred == purchasesReferred));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,referredAccounts,referralCode,purchasesReferred);

@override
String toString() {
  return 'ReferralData(referredAccounts: $referredAccounts, referralCode: $referralCode, purchasesReferred: $purchasesReferred)';
}


}

/// @nodoc
abstract mixin class _$ReferralDataCopyWith<$Res> implements $ReferralDataCopyWith<$Res> {
  factory _$ReferralDataCopyWith(_ReferralData value, $Res Function(_ReferralData) _then) = __$ReferralDataCopyWithImpl;
@override @useResult
$Res call({
 int referredAccounts, String referralCode, int purchasesReferred
});




}
/// @nodoc
class __$ReferralDataCopyWithImpl<$Res>
    implements _$ReferralDataCopyWith<$Res> {
  __$ReferralDataCopyWithImpl(this._self, this._then);

  final _ReferralData _self;
  final $Res Function(_ReferralData) _then;

/// Create a copy of ReferralData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? referredAccounts = null,Object? referralCode = null,Object? purchasesReferred = null,}) {
  return _then(_ReferralData(
referredAccounts: null == referredAccounts ? _self.referredAccounts : referredAccounts // ignore: cast_nullable_to_non_nullable
as int,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,purchasesReferred: null == purchasesReferred ? _self.purchasesReferred : purchasesReferred // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
