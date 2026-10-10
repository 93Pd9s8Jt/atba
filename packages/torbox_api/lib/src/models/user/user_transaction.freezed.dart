// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserTransaction {

 String get at; String get type; int get amount; String get transactionId;
/// Create a copy of UserTransaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserTransactionCopyWith<UserTransaction> get copyWith => _$UserTransactionCopyWithImpl<UserTransaction>(this as UserTransaction, _$identity);

  /// Serializes this UserTransaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserTransaction&&(identical(other.at, at) || other.at == at)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,at,type,amount,transactionId);

@override
String toString() {
  return 'UserTransaction(at: $at, type: $type, amount: $amount, transactionId: $transactionId)';
}


}

/// @nodoc
abstract mixin class $UserTransactionCopyWith<$Res>  {
  factory $UserTransactionCopyWith(UserTransaction value, $Res Function(UserTransaction) _then) = _$UserTransactionCopyWithImpl;
@useResult
$Res call({
 String at, String type, int amount, String transactionId
});




}
/// @nodoc
class _$UserTransactionCopyWithImpl<$Res>
    implements $UserTransactionCopyWith<$Res> {
  _$UserTransactionCopyWithImpl(this._self, this._then);

  final UserTransaction _self;
  final $Res Function(UserTransaction) _then;

/// Create a copy of UserTransaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? at = null,Object? type = null,Object? amount = null,Object? transactionId = null,}) {
  return _then(_self.copyWith(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserTransaction].
extension UserTransactionPatterns on UserTransaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserTransaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserTransaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserTransaction value)  $default,){
final _that = this;
switch (_that) {
case _UserTransaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserTransaction value)?  $default,){
final _that = this;
switch (_that) {
case _UserTransaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String at,  String type,  int amount,  String transactionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserTransaction() when $default != null:
return $default(_that.at,_that.type,_that.amount,_that.transactionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String at,  String type,  int amount,  String transactionId)  $default,) {final _that = this;
switch (_that) {
case _UserTransaction():
return $default(_that.at,_that.type,_that.amount,_that.transactionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String at,  String type,  int amount,  String transactionId)?  $default,) {final _that = this;
switch (_that) {
case _UserTransaction() when $default != null:
return $default(_that.at,_that.type,_that.amount,_that.transactionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserTransaction implements UserTransaction {
  const _UserTransaction({required this.at, required this.type, required this.amount, required this.transactionId});
  factory _UserTransaction.fromJson(Map<String, dynamic> json) => _$UserTransactionFromJson(json);

@override final  String at;
@override final  String type;
@override final  int amount;
@override final  String transactionId;

/// Create a copy of UserTransaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserTransactionCopyWith<_UserTransaction> get copyWith => __$UserTransactionCopyWithImpl<_UserTransaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserTransactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserTransaction&&(identical(other.at, at) || other.at == at)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,at,type,amount,transactionId);

@override
String toString() {
  return 'UserTransaction(at: $at, type: $type, amount: $amount, transactionId: $transactionId)';
}


}

/// @nodoc
abstract mixin class _$UserTransactionCopyWith<$Res> implements $UserTransactionCopyWith<$Res> {
  factory _$UserTransactionCopyWith(_UserTransaction value, $Res Function(_UserTransaction) _then) = __$UserTransactionCopyWithImpl;
@override @useResult
$Res call({
 String at, String type, int amount, String transactionId
});




}
/// @nodoc
class __$UserTransactionCopyWithImpl<$Res>
    implements _$UserTransactionCopyWith<$Res> {
  __$UserTransactionCopyWithImpl(this._self, this._then);

  final _UserTransaction _self;
  final $Res Function(_UserTransaction) _then;

/// Create a copy of UserTransaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? at = null,Object? type = null,Object? amount = null,Object? transactionId = null,}) {
  return _then(_UserTransaction(
at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
