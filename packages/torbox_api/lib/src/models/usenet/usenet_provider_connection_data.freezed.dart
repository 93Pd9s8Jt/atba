// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usenet_provider_connection_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsenetProviderConnectionData {

 String get host; int get port; bool get ssl; String get username; String get password; int get connections; int get retention; String get limitations;
/// Create a copy of UsenetProviderConnectionData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsenetProviderConnectionDataCopyWith<UsenetProviderConnectionData> get copyWith => _$UsenetProviderConnectionDataCopyWithImpl<UsenetProviderConnectionData>(this as UsenetProviderConnectionData, _$identity);

  /// Serializes this UsenetProviderConnectionData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsenetProviderConnectionData&&(identical(other.host, host) || other.host == host)&&(identical(other.port, port) || other.port == port)&&(identical(other.ssl, ssl) || other.ssl == ssl)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.connections, connections) || other.connections == connections)&&(identical(other.retention, retention) || other.retention == retention)&&(identical(other.limitations, limitations) || other.limitations == limitations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,port,ssl,username,password,connections,retention,limitations);

@override
String toString() {
  return 'UsenetProviderConnectionData(host: $host, port: $port, ssl: $ssl, username: $username, password: $password, connections: $connections, retention: $retention, limitations: $limitations)';
}


}

/// @nodoc
abstract mixin class $UsenetProviderConnectionDataCopyWith<$Res>  {
  factory $UsenetProviderConnectionDataCopyWith(UsenetProviderConnectionData value, $Res Function(UsenetProviderConnectionData) _then) = _$UsenetProviderConnectionDataCopyWithImpl;
@useResult
$Res call({
 String host, int port, bool ssl, String username, String password, int connections, int retention, String limitations
});




}
/// @nodoc
class _$UsenetProviderConnectionDataCopyWithImpl<$Res>
    implements $UsenetProviderConnectionDataCopyWith<$Res> {
  _$UsenetProviderConnectionDataCopyWithImpl(this._self, this._then);

  final UsenetProviderConnectionData _self;
  final $Res Function(UsenetProviderConnectionData) _then;

/// Create a copy of UsenetProviderConnectionData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? host = null,Object? port = null,Object? ssl = null,Object? username = null,Object? password = null,Object? connections = null,Object? retention = null,Object? limitations = null,}) {
  return _then(_self.copyWith(
host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,ssl: null == ssl ? _self.ssl : ssl // ignore: cast_nullable_to_non_nullable
as bool,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,connections: null == connections ? _self.connections : connections // ignore: cast_nullable_to_non_nullable
as int,retention: null == retention ? _self.retention : retention // ignore: cast_nullable_to_non_nullable
as int,limitations: null == limitations ? _self.limitations : limitations // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UsenetProviderConnectionData].
extension UsenetProviderConnectionDataPatterns on UsenetProviderConnectionData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsenetProviderConnectionData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsenetProviderConnectionData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsenetProviderConnectionData value)  $default,){
final _that = this;
switch (_that) {
case _UsenetProviderConnectionData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsenetProviderConnectionData value)?  $default,){
final _that = this;
switch (_that) {
case _UsenetProviderConnectionData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String host,  int port,  bool ssl,  String username,  String password,  int connections,  int retention,  String limitations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsenetProviderConnectionData() when $default != null:
return $default(_that.host,_that.port,_that.ssl,_that.username,_that.password,_that.connections,_that.retention,_that.limitations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String host,  int port,  bool ssl,  String username,  String password,  int connections,  int retention,  String limitations)  $default,) {final _that = this;
switch (_that) {
case _UsenetProviderConnectionData():
return $default(_that.host,_that.port,_that.ssl,_that.username,_that.password,_that.connections,_that.retention,_that.limitations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String host,  int port,  bool ssl,  String username,  String password,  int connections,  int retention,  String limitations)?  $default,) {final _that = this;
switch (_that) {
case _UsenetProviderConnectionData() when $default != null:
return $default(_that.host,_that.port,_that.ssl,_that.username,_that.password,_that.connections,_that.retention,_that.limitations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsenetProviderConnectionData implements UsenetProviderConnectionData {
  const _UsenetProviderConnectionData({required this.host, required this.port, required this.ssl, required this.username, required this.password, required this.connections, required this.retention, required this.limitations});
  factory _UsenetProviderConnectionData.fromJson(Map<String, dynamic> json) => _$UsenetProviderConnectionDataFromJson(json);

@override final  String host;
@override final  int port;
@override final  bool ssl;
@override final  String username;
@override final  String password;
@override final  int connections;
@override final  int retention;
@override final  String limitations;

/// Create a copy of UsenetProviderConnectionData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsenetProviderConnectionDataCopyWith<_UsenetProviderConnectionData> get copyWith => __$UsenetProviderConnectionDataCopyWithImpl<_UsenetProviderConnectionData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsenetProviderConnectionDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsenetProviderConnectionData&&(identical(other.host, host) || other.host == host)&&(identical(other.port, port) || other.port == port)&&(identical(other.ssl, ssl) || other.ssl == ssl)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.connections, connections) || other.connections == connections)&&(identical(other.retention, retention) || other.retention == retention)&&(identical(other.limitations, limitations) || other.limitations == limitations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,host,port,ssl,username,password,connections,retention,limitations);

@override
String toString() {
  return 'UsenetProviderConnectionData(host: $host, port: $port, ssl: $ssl, username: $username, password: $password, connections: $connections, retention: $retention, limitations: $limitations)';
}


}

/// @nodoc
abstract mixin class _$UsenetProviderConnectionDataCopyWith<$Res> implements $UsenetProviderConnectionDataCopyWith<$Res> {
  factory _$UsenetProviderConnectionDataCopyWith(_UsenetProviderConnectionData value, $Res Function(_UsenetProviderConnectionData) _then) = __$UsenetProviderConnectionDataCopyWithImpl;
@override @useResult
$Res call({
 String host, int port, bool ssl, String username, String password, int connections, int retention, String limitations
});




}
/// @nodoc
class __$UsenetProviderConnectionDataCopyWithImpl<$Res>
    implements _$UsenetProviderConnectionDataCopyWith<$Res> {
  __$UsenetProviderConnectionDataCopyWithImpl(this._self, this._then);

  final _UsenetProviderConnectionData _self;
  final $Res Function(_UsenetProviderConnectionData) _then;

/// Create a copy of UsenetProviderConnectionData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? host = null,Object? port = null,Object? ssl = null,Object? username = null,Object? password = null,Object? connections = null,Object? retention = null,Object? limitations = null,}) {
  return _then(_UsenetProviderConnectionData(
host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,ssl: null == ssl ? _self.ssl : ssl // ignore: cast_nullable_to_non_nullable
as bool,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,connections: null == connections ? _self.connections : connections // ignore: cast_nullable_to_non_nullable
as int,retention: null == retention ? _self.retention : retention // ignore: cast_nullable_to_non_nullable
as int,limitations: null == limitations ? _self.limitations : limitations // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
