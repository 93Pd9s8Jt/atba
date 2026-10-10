// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usenet_provider_account_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsenetProviderAccountData {

 String get host; int get port; bool get ssl; int get connections; String get username; String get password;
/// Create a copy of UsenetProviderAccountData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsenetProviderAccountDataCopyWith<UsenetProviderAccountData> get copyWith => _$UsenetProviderAccountDataCopyWithImpl<UsenetProviderAccountData>(this as UsenetProviderAccountData, _$identity);

  /// Serializes this UsenetProviderAccountData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsenetProviderAccountData&&(identical(other.host, host) || other.host == host)&&(identical(other.port, port) || other.port == port)&&(identical(other.ssl, ssl) || other.ssl == ssl)&&(identical(other.connections, connections) || other.connections == connections)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,port,ssl,connections,username,password);

@override
String toString() {
  return 'UsenetProviderAccountData(host: $host, port: $port, ssl: $ssl, connections: $connections, username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class $UsenetProviderAccountDataCopyWith<$Res>  {
  factory $UsenetProviderAccountDataCopyWith(UsenetProviderAccountData value, $Res Function(UsenetProviderAccountData) _then) = _$UsenetProviderAccountDataCopyWithImpl;
@useResult
$Res call({
 String host, int port, bool ssl, int connections, String username, String password
});




}
/// @nodoc
class _$UsenetProviderAccountDataCopyWithImpl<$Res>
    implements $UsenetProviderAccountDataCopyWith<$Res> {
  _$UsenetProviderAccountDataCopyWithImpl(this._self, this._then);

  final UsenetProviderAccountData _self;
  final $Res Function(UsenetProviderAccountData) _then;

/// Create a copy of UsenetProviderAccountData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? host = null,Object? port = null,Object? ssl = null,Object? connections = null,Object? username = null,Object? password = null,}) {
  return _then(_self.copyWith(
host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,ssl: null == ssl ? _self.ssl : ssl // ignore: cast_nullable_to_non_nullable
as bool,connections: null == connections ? _self.connections : connections // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UsenetProviderAccountData].
extension UsenetProviderAccountDataPatterns on UsenetProviderAccountData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsenetProviderAccountData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsenetProviderAccountData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsenetProviderAccountData value)  $default,){
final _that = this;
switch (_that) {
case _UsenetProviderAccountData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsenetProviderAccountData value)?  $default,){
final _that = this;
switch (_that) {
case _UsenetProviderAccountData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String host,  int port,  bool ssl,  int connections,  String username,  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsenetProviderAccountData() when $default != null:
return $default(_that.host,_that.port,_that.ssl,_that.connections,_that.username,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String host,  int port,  bool ssl,  int connections,  String username,  String password)  $default,) {final _that = this;
switch (_that) {
case _UsenetProviderAccountData():
return $default(_that.host,_that.port,_that.ssl,_that.connections,_that.username,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String host,  int port,  bool ssl,  int connections,  String username,  String password)?  $default,) {final _that = this;
switch (_that) {
case _UsenetProviderAccountData() when $default != null:
return $default(_that.host,_that.port,_that.ssl,_that.connections,_that.username,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsenetProviderAccountData implements UsenetProviderAccountData {
  const _UsenetProviderAccountData({required this.host, required this.port, required this.ssl, required this.connections, required this.username, required this.password});
  factory _UsenetProviderAccountData.fromJson(Map<String, dynamic> json) => _$UsenetProviderAccountDataFromJson(json);

@override final  String host;
@override final  int port;
@override final  bool ssl;
@override final  int connections;
@override final  String username;
@override final  String password;

/// Create a copy of UsenetProviderAccountData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsenetProviderAccountDataCopyWith<_UsenetProviderAccountData> get copyWith => __$UsenetProviderAccountDataCopyWithImpl<_UsenetProviderAccountData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsenetProviderAccountDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsenetProviderAccountData&&(identical(other.host, host) || other.host == host)&&(identical(other.port, port) || other.port == port)&&(identical(other.ssl, ssl) || other.ssl == ssl)&&(identical(other.connections, connections) || other.connections == connections)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,port,ssl,connections,username,password);

@override
String toString() {
  return 'UsenetProviderAccountData(host: $host, port: $port, ssl: $ssl, connections: $connections, username: $username, password: $password)';
}


}

/// @nodoc
abstract mixin class _$UsenetProviderAccountDataCopyWith<$Res> implements $UsenetProviderAccountDataCopyWith<$Res> {
  factory _$UsenetProviderAccountDataCopyWith(_UsenetProviderAccountData value, $Res Function(_UsenetProviderAccountData) _then) = __$UsenetProviderAccountDataCopyWithImpl;
@override @useResult
$Res call({
 String host, int port, bool ssl, int connections, String username, String password
});




}
/// @nodoc
class __$UsenetProviderAccountDataCopyWithImpl<$Res>
    implements _$UsenetProviderAccountDataCopyWith<$Res> {
  __$UsenetProviderAccountDataCopyWithImpl(this._self, this._then);

  final _UsenetProviderAccountData _self;
  final $Res Function(_UsenetProviderAccountData) _then;

/// Create a copy of UsenetProviderAccountData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? host = null,Object? port = null,Object? ssl = null,Object? connections = null,Object? username = null,Object? password = null,}) {
  return _then(_UsenetProviderAccountData(
host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,ssl: null == ssl ? _self.ssl : ssl // ignore: cast_nullable_to_non_nullable
as bool,connections: null == connections ? _self.connections : connections // ignore: cast_nullable_to_non_nullable
as int,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
