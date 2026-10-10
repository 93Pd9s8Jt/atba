// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validation_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ValidationErrorItem {

/// Location of the failing field, e.g. `["body", "hashes", 0]`.
 List<Object?> get loc; String get msg; String get type; Object? get input; Map<String, dynamic>? get ctx;
/// Create a copy of ValidationErrorItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ValidationErrorItemCopyWith<ValidationErrorItem> get copyWith => _$ValidationErrorItemCopyWithImpl<ValidationErrorItem>(this as ValidationErrorItem, _$identity);

  /// Serializes this ValidationErrorItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ValidationErrorItem&&const DeepCollectionEquality().equals(other.loc, loc)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.input, input)&&const DeepCollectionEquality().equals(other.ctx, ctx));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(loc),msg,type,const DeepCollectionEquality().hash(input),const DeepCollectionEquality().hash(ctx));

@override
String toString() {
  return 'ValidationErrorItem(loc: $loc, msg: $msg, type: $type, input: $input, ctx: $ctx)';
}


}

/// @nodoc
abstract mixin class $ValidationErrorItemCopyWith<$Res>  {
  factory $ValidationErrorItemCopyWith(ValidationErrorItem value, $Res Function(ValidationErrorItem) _then) = _$ValidationErrorItemCopyWithImpl;
@useResult
$Res call({
 List<Object?> loc, String msg, String type, Object? input, Map<String, dynamic>? ctx
});




}
/// @nodoc
class _$ValidationErrorItemCopyWithImpl<$Res>
    implements $ValidationErrorItemCopyWith<$Res> {
  _$ValidationErrorItemCopyWithImpl(this._self, this._then);

  final ValidationErrorItem _self;
  final $Res Function(ValidationErrorItem) _then;

/// Create a copy of ValidationErrorItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loc = null,Object? msg = null,Object? type = null,Object? input = freezed,Object? ctx = freezed,}) {
  return _then(_self.copyWith(
loc: null == loc ? _self.loc : loc // ignore: cast_nullable_to_non_nullable
as List<Object?>,msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,input: freezed == input ? _self.input : input ,ctx: freezed == ctx ? _self.ctx : ctx // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ValidationErrorItem].
extension ValidationErrorItemPatterns on ValidationErrorItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ValidationErrorItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ValidationErrorItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ValidationErrorItem value)  $default,){
final _that = this;
switch (_that) {
case _ValidationErrorItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ValidationErrorItem value)?  $default,){
final _that = this;
switch (_that) {
case _ValidationErrorItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Object?> loc,  String msg,  String type,  Object? input,  Map<String, dynamic>? ctx)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ValidationErrorItem() when $default != null:
return $default(_that.loc,_that.msg,_that.type,_that.input,_that.ctx);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Object?> loc,  String msg,  String type,  Object? input,  Map<String, dynamic>? ctx)  $default,) {final _that = this;
switch (_that) {
case _ValidationErrorItem():
return $default(_that.loc,_that.msg,_that.type,_that.input,_that.ctx);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Object?> loc,  String msg,  String type,  Object? input,  Map<String, dynamic>? ctx)?  $default,) {final _that = this;
switch (_that) {
case _ValidationErrorItem() when $default != null:
return $default(_that.loc,_that.msg,_that.type,_that.input,_that.ctx);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ValidationErrorItem implements ValidationErrorItem {
  const _ValidationErrorItem({required final  List<Object?> loc, required this.msg, required this.type, this.input, final  Map<String, dynamic>? ctx}): _loc = loc,_ctx = ctx;
  factory _ValidationErrorItem.fromJson(Map<String, dynamic> json) => _$ValidationErrorItemFromJson(json);

/// Location of the failing field, e.g. `["body", "hashes", 0]`.
 final  List<Object?> _loc;
/// Location of the failing field, e.g. `["body", "hashes", 0]`.
@override List<Object?> get loc {
  if (_loc is EqualUnmodifiableListView) return _loc;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_loc);
}

@override final  String msg;
@override final  String type;
@override final  Object? input;
 final  Map<String, dynamic>? _ctx;
@override Map<String, dynamic>? get ctx {
  final value = _ctx;
  if (value == null) return null;
  if (_ctx is EqualUnmodifiableMapView) return _ctx;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ValidationErrorItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationErrorItemCopyWith<_ValidationErrorItem> get copyWith => __$ValidationErrorItemCopyWithImpl<_ValidationErrorItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ValidationErrorItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationErrorItem&&const DeepCollectionEquality().equals(other._loc, _loc)&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.input, input)&&const DeepCollectionEquality().equals(other._ctx, _ctx));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_loc),msg,type,const DeepCollectionEquality().hash(input),const DeepCollectionEquality().hash(_ctx));

@override
String toString() {
  return 'ValidationErrorItem(loc: $loc, msg: $msg, type: $type, input: $input, ctx: $ctx)';
}


}

/// @nodoc
abstract mixin class _$ValidationErrorItemCopyWith<$Res> implements $ValidationErrorItemCopyWith<$Res> {
  factory _$ValidationErrorItemCopyWith(_ValidationErrorItem value, $Res Function(_ValidationErrorItem) _then) = __$ValidationErrorItemCopyWithImpl;
@override @useResult
$Res call({
 List<Object?> loc, String msg, String type, Object? input, Map<String, dynamic>? ctx
});




}
/// @nodoc
class __$ValidationErrorItemCopyWithImpl<$Res>
    implements _$ValidationErrorItemCopyWith<$Res> {
  __$ValidationErrorItemCopyWithImpl(this._self, this._then);

  final _ValidationErrorItem _self;
  final $Res Function(_ValidationErrorItem) _then;

/// Create a copy of ValidationErrorItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loc = null,Object? msg = null,Object? type = null,Object? input = freezed,Object? ctx = freezed,}) {
  return _then(_ValidationErrorItem(
loc: null == loc ? _self._loc : loc // ignore: cast_nullable_to_non_nullable
as List<Object?>,msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,input: freezed == input ? _self.input : input ,ctx: freezed == ctx ? _self._ctx : ctx // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$HttpValidationError {

 List<ValidationErrorItem> get detail;
/// Create a copy of HttpValidationError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HttpValidationErrorCopyWith<HttpValidationError> get copyWith => _$HttpValidationErrorCopyWithImpl<HttpValidationError>(this as HttpValidationError, _$identity);

  /// Serializes this HttpValidationError to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpValidationError&&const DeepCollectionEquality().equals(other.detail, detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(detail));

@override
String toString() {
  return 'HttpValidationError(detail: $detail)';
}


}

/// @nodoc
abstract mixin class $HttpValidationErrorCopyWith<$Res>  {
  factory $HttpValidationErrorCopyWith(HttpValidationError value, $Res Function(HttpValidationError) _then) = _$HttpValidationErrorCopyWithImpl;
@useResult
$Res call({
 List<ValidationErrorItem> detail
});




}
/// @nodoc
class _$HttpValidationErrorCopyWithImpl<$Res>
    implements $HttpValidationErrorCopyWith<$Res> {
  _$HttpValidationErrorCopyWithImpl(this._self, this._then);

  final HttpValidationError _self;
  final $Res Function(HttpValidationError) _then;

/// Create a copy of HttpValidationError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? detail = null,}) {
  return _then(_self.copyWith(
detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as List<ValidationErrorItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [HttpValidationError].
extension HttpValidationErrorPatterns on HttpValidationError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HttpValidationError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HttpValidationError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HttpValidationError value)  $default,){
final _that = this;
switch (_that) {
case _HttpValidationError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HttpValidationError value)?  $default,){
final _that = this;
switch (_that) {
case _HttpValidationError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ValidationErrorItem> detail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HttpValidationError() when $default != null:
return $default(_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ValidationErrorItem> detail)  $default,) {final _that = this;
switch (_that) {
case _HttpValidationError():
return $default(_that.detail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ValidationErrorItem> detail)?  $default,) {final _that = this;
switch (_that) {
case _HttpValidationError() when $default != null:
return $default(_that.detail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HttpValidationError implements HttpValidationError {
  const _HttpValidationError({required final  List<ValidationErrorItem> detail}): _detail = detail;
  factory _HttpValidationError.fromJson(Map<String, dynamic> json) => _$HttpValidationErrorFromJson(json);

 final  List<ValidationErrorItem> _detail;
@override List<ValidationErrorItem> get detail {
  if (_detail is EqualUnmodifiableListView) return _detail;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_detail);
}


/// Create a copy of HttpValidationError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HttpValidationErrorCopyWith<_HttpValidationError> get copyWith => __$HttpValidationErrorCopyWithImpl<_HttpValidationError>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HttpValidationErrorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HttpValidationError&&const DeepCollectionEquality().equals(other._detail, _detail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_detail));

@override
String toString() {
  return 'HttpValidationError(detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$HttpValidationErrorCopyWith<$Res> implements $HttpValidationErrorCopyWith<$Res> {
  factory _$HttpValidationErrorCopyWith(_HttpValidationError value, $Res Function(_HttpValidationError) _then) = __$HttpValidationErrorCopyWithImpl;
@override @useResult
$Res call({
 List<ValidationErrorItem> detail
});




}
/// @nodoc
class __$HttpValidationErrorCopyWithImpl<$Res>
    implements _$HttpValidationErrorCopyWith<$Res> {
  __$HttpValidationErrorCopyWithImpl(this._self, this._then);

  final _HttpValidationError _self;
  final $Res Function(_HttpValidationError) _then;

/// Create a copy of HttpValidationError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? detail = null,}) {
  return _then(_HttpValidationError(
detail: null == detail ? _self._detail : detail // ignore: cast_nullable_to_non_nullable
as List<ValidationErrorItem>,
  ));
}


}

// dart format on
