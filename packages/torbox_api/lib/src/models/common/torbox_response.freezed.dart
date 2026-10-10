// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'torbox_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TorBoxResponse<T> {

 bool get success;/// Machine-readable error code, or `null` on success.
@TorBoxErrorCodeConverter() String? get error;/// User-friendly message, whether success or failure.
 String? get detail;/// Typed response payload. The exact type depends on the endpoint; it may
/// be absent (`null`) for operations that return no data.
 T? get data;
/// Create a copy of TorBoxResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TorBoxResponseCopyWith<T, TorBoxResponse<T>> get copyWith => _$TorBoxResponseCopyWithImpl<T, TorBoxResponse<T>>(this as TorBoxResponse<T>, _$identity);

  /// Serializes this TorBoxResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TorBoxResponse<T>&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error)&&(identical(other.detail, detail) || other.detail == detail)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,error,detail,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'TorBoxResponse<$T>(success: $success, error: $error, detail: $detail, data: $data)';
}


}

/// @nodoc
abstract mixin class $TorBoxResponseCopyWith<T,$Res>  {
  factory $TorBoxResponseCopyWith(TorBoxResponse<T> value, $Res Function(TorBoxResponse<T>) _then) = _$TorBoxResponseCopyWithImpl;
@useResult
$Res call({
 bool success,@TorBoxErrorCodeConverter() String? error, String? detail, T? data
});




}
/// @nodoc
class _$TorBoxResponseCopyWithImpl<T,$Res>
    implements $TorBoxResponseCopyWith<T, $Res> {
  _$TorBoxResponseCopyWithImpl(this._self, this._then);

  final TorBoxResponse<T> _self;
  final $Res Function(TorBoxResponse<T>) _then;

/// Create a copy of TorBoxResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? error = freezed,Object? detail = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [TorBoxResponse].
extension TorBoxResponsePatterns<T> on TorBoxResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TorBoxResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TorBoxResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TorBoxResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _TorBoxResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TorBoxResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _TorBoxResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success, @TorBoxErrorCodeConverter()  String? error,  String? detail,  T? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TorBoxResponse() when $default != null:
return $default(_that.success,_that.error,_that.detail,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success, @TorBoxErrorCodeConverter()  String? error,  String? detail,  T? data)  $default,) {final _that = this;
switch (_that) {
case _TorBoxResponse():
return $default(_that.success,_that.error,_that.detail,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success, @TorBoxErrorCodeConverter()  String? error,  String? detail,  T? data)?  $default,) {final _that = this;
switch (_that) {
case _TorBoxResponse() when $default != null:
return $default(_that.success,_that.error,_that.detail,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _TorBoxResponse<T> implements TorBoxResponse<T> {
  const _TorBoxResponse({required this.success, @TorBoxErrorCodeConverter() this.error, this.detail, this.data});
  factory _TorBoxResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$TorBoxResponseFromJson(json,fromJsonT);

@override final  bool success;
/// Machine-readable error code, or `null` on success.
@override@TorBoxErrorCodeConverter() final  String? error;
/// User-friendly message, whether success or failure.
@override final  String? detail;
/// Typed response payload. The exact type depends on the endpoint; it may
/// be absent (`null`) for operations that return no data.
@override final  T? data;

/// Create a copy of TorBoxResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TorBoxResponseCopyWith<T, _TorBoxResponse<T>> get copyWith => __$TorBoxResponseCopyWithImpl<T, _TorBoxResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$TorBoxResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TorBoxResponse<T>&&(identical(other.success, success) || other.success == success)&&(identical(other.error, error) || other.error == error)&&(identical(other.detail, detail) || other.detail == detail)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,error,detail,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'TorBoxResponse<$T>(success: $success, error: $error, detail: $detail, data: $data)';
}


}

/// @nodoc
abstract mixin class _$TorBoxResponseCopyWith<T,$Res> implements $TorBoxResponseCopyWith<T, $Res> {
  factory _$TorBoxResponseCopyWith(_TorBoxResponse<T> value, $Res Function(_TorBoxResponse<T>) _then) = __$TorBoxResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success,@TorBoxErrorCodeConverter() String? error, String? detail, T? data
});




}
/// @nodoc
class __$TorBoxResponseCopyWithImpl<T,$Res>
    implements _$TorBoxResponseCopyWith<T, $Res> {
  __$TorBoxResponseCopyWithImpl(this._self, this._then);

  final _TorBoxResponse<T> _self;
  final $Res Function(_TorBoxResponse<T>) _then;

/// Create a copy of TorBoxResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? error = freezed,Object? detail = freezed,Object? data = freezed,}) {
  return _then(_TorBoxResponse<T>(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

// dart format on
