// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hoster_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HosterData {

 int get id; String get name;/// Domains this hoster matches.
 List<String> get domains; String get url; String get icon; bool get status; String get type; String? get note; bool get nsfw; int get dailyLinkLimit; int get dailyLinkUsed; int get dailyBandwidthLimit; int get dailyBandwidthUsed; int get perLinkSizeLimit; String get regex;
/// Create a copy of HosterData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HosterDataCopyWith<HosterData> get copyWith => _$HosterDataCopyWithImpl<HosterData>(this as HosterData, _$identity);

  /// Serializes this HosterData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HosterData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.domains, domains)&&(identical(other.url, url) || other.url == url)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.note, note) || other.note == note)&&(identical(other.nsfw, nsfw) || other.nsfw == nsfw)&&(identical(other.dailyLinkLimit, dailyLinkLimit) || other.dailyLinkLimit == dailyLinkLimit)&&(identical(other.dailyLinkUsed, dailyLinkUsed) || other.dailyLinkUsed == dailyLinkUsed)&&(identical(other.dailyBandwidthLimit, dailyBandwidthLimit) || other.dailyBandwidthLimit == dailyBandwidthLimit)&&(identical(other.dailyBandwidthUsed, dailyBandwidthUsed) || other.dailyBandwidthUsed == dailyBandwidthUsed)&&(identical(other.perLinkSizeLimit, perLinkSizeLimit) || other.perLinkSizeLimit == perLinkSizeLimit)&&(identical(other.regex, regex) || other.regex == regex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(domains),url,icon,status,type,note,nsfw,dailyLinkLimit,dailyLinkUsed,dailyBandwidthLimit,dailyBandwidthUsed,perLinkSizeLimit,regex);

@override
String toString() {
  return 'HosterData(id: $id, name: $name, domains: $domains, url: $url, icon: $icon, status: $status, type: $type, note: $note, nsfw: $nsfw, dailyLinkLimit: $dailyLinkLimit, dailyLinkUsed: $dailyLinkUsed, dailyBandwidthLimit: $dailyBandwidthLimit, dailyBandwidthUsed: $dailyBandwidthUsed, perLinkSizeLimit: $perLinkSizeLimit, regex: $regex)';
}


}

/// @nodoc
abstract mixin class $HosterDataCopyWith<$Res>  {
  factory $HosterDataCopyWith(HosterData value, $Res Function(HosterData) _then) = _$HosterDataCopyWithImpl;
@useResult
$Res call({
 int id, String name, List<String> domains, String url, String icon, bool status, String type, String? note, bool nsfw, int dailyLinkLimit, int dailyLinkUsed, int dailyBandwidthLimit, int dailyBandwidthUsed, int perLinkSizeLimit, String regex
});




}
/// @nodoc
class _$HosterDataCopyWithImpl<$Res>
    implements $HosterDataCopyWith<$Res> {
  _$HosterDataCopyWithImpl(this._self, this._then);

  final HosterData _self;
  final $Res Function(HosterData) _then;

/// Create a copy of HosterData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? domains = null,Object? url = null,Object? icon = null,Object? status = null,Object? type = null,Object? note = freezed,Object? nsfw = null,Object? dailyLinkLimit = null,Object? dailyLinkUsed = null,Object? dailyBandwidthLimit = null,Object? dailyBandwidthUsed = null,Object? perLinkSizeLimit = null,Object? regex = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,domains: null == domains ? _self.domains : domains // ignore: cast_nullable_to_non_nullable
as List<String>,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,nsfw: null == nsfw ? _self.nsfw : nsfw // ignore: cast_nullable_to_non_nullable
as bool,dailyLinkLimit: null == dailyLinkLimit ? _self.dailyLinkLimit : dailyLinkLimit // ignore: cast_nullable_to_non_nullable
as int,dailyLinkUsed: null == dailyLinkUsed ? _self.dailyLinkUsed : dailyLinkUsed // ignore: cast_nullable_to_non_nullable
as int,dailyBandwidthLimit: null == dailyBandwidthLimit ? _self.dailyBandwidthLimit : dailyBandwidthLimit // ignore: cast_nullable_to_non_nullable
as int,dailyBandwidthUsed: null == dailyBandwidthUsed ? _self.dailyBandwidthUsed : dailyBandwidthUsed // ignore: cast_nullable_to_non_nullable
as int,perLinkSizeLimit: null == perLinkSizeLimit ? _self.perLinkSizeLimit : perLinkSizeLimit // ignore: cast_nullable_to_non_nullable
as int,regex: null == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HosterData].
extension HosterDataPatterns on HosterData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HosterData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HosterData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HosterData value)  $default,){
final _that = this;
switch (_that) {
case _HosterData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HosterData value)?  $default,){
final _that = this;
switch (_that) {
case _HosterData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  List<String> domains,  String url,  String icon,  bool status,  String type,  String? note,  bool nsfw,  int dailyLinkLimit,  int dailyLinkUsed,  int dailyBandwidthLimit,  int dailyBandwidthUsed,  int perLinkSizeLimit,  String regex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HosterData() when $default != null:
return $default(_that.id,_that.name,_that.domains,_that.url,_that.icon,_that.status,_that.type,_that.note,_that.nsfw,_that.dailyLinkLimit,_that.dailyLinkUsed,_that.dailyBandwidthLimit,_that.dailyBandwidthUsed,_that.perLinkSizeLimit,_that.regex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  List<String> domains,  String url,  String icon,  bool status,  String type,  String? note,  bool nsfw,  int dailyLinkLimit,  int dailyLinkUsed,  int dailyBandwidthLimit,  int dailyBandwidthUsed,  int perLinkSizeLimit,  String regex)  $default,) {final _that = this;
switch (_that) {
case _HosterData():
return $default(_that.id,_that.name,_that.domains,_that.url,_that.icon,_that.status,_that.type,_that.note,_that.nsfw,_that.dailyLinkLimit,_that.dailyLinkUsed,_that.dailyBandwidthLimit,_that.dailyBandwidthUsed,_that.perLinkSizeLimit,_that.regex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  List<String> domains,  String url,  String icon,  bool status,  String type,  String? note,  bool nsfw,  int dailyLinkLimit,  int dailyLinkUsed,  int dailyBandwidthLimit,  int dailyBandwidthUsed,  int perLinkSizeLimit,  String regex)?  $default,) {final _that = this;
switch (_that) {
case _HosterData() when $default != null:
return $default(_that.id,_that.name,_that.domains,_that.url,_that.icon,_that.status,_that.type,_that.note,_that.nsfw,_that.dailyLinkLimit,_that.dailyLinkUsed,_that.dailyBandwidthLimit,_that.dailyBandwidthUsed,_that.perLinkSizeLimit,_that.regex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HosterData implements HosterData {
  const _HosterData({required this.id, required this.name, required final  List<String> domains, required this.url, required this.icon, required this.status, required this.type, this.note, required this.nsfw, required this.dailyLinkLimit, required this.dailyLinkUsed, required this.dailyBandwidthLimit, required this.dailyBandwidthUsed, required this.perLinkSizeLimit, required this.regex}): _domains = domains;
  factory _HosterData.fromJson(Map<String, dynamic> json) => _$HosterDataFromJson(json);

@override final  int id;
@override final  String name;
/// Domains this hoster matches.
 final  List<String> _domains;
/// Domains this hoster matches.
@override List<String> get domains {
  if (_domains is EqualUnmodifiableListView) return _domains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_domains);
}

@override final  String url;
@override final  String icon;
@override final  bool status;
@override final  String type;
@override final  String? note;
@override final  bool nsfw;
@override final  int dailyLinkLimit;
@override final  int dailyLinkUsed;
@override final  int dailyBandwidthLimit;
@override final  int dailyBandwidthUsed;
@override final  int perLinkSizeLimit;
@override final  String regex;

/// Create a copy of HosterData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HosterDataCopyWith<_HosterData> get copyWith => __$HosterDataCopyWithImpl<_HosterData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HosterDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HosterData&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._domains, _domains)&&(identical(other.url, url) || other.url == url)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.note, note) || other.note == note)&&(identical(other.nsfw, nsfw) || other.nsfw == nsfw)&&(identical(other.dailyLinkLimit, dailyLinkLimit) || other.dailyLinkLimit == dailyLinkLimit)&&(identical(other.dailyLinkUsed, dailyLinkUsed) || other.dailyLinkUsed == dailyLinkUsed)&&(identical(other.dailyBandwidthLimit, dailyBandwidthLimit) || other.dailyBandwidthLimit == dailyBandwidthLimit)&&(identical(other.dailyBandwidthUsed, dailyBandwidthUsed) || other.dailyBandwidthUsed == dailyBandwidthUsed)&&(identical(other.perLinkSizeLimit, perLinkSizeLimit) || other.perLinkSizeLimit == perLinkSizeLimit)&&(identical(other.regex, regex) || other.regex == regex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_domains),url,icon,status,type,note,nsfw,dailyLinkLimit,dailyLinkUsed,dailyBandwidthLimit,dailyBandwidthUsed,perLinkSizeLimit,regex);

@override
String toString() {
  return 'HosterData(id: $id, name: $name, domains: $domains, url: $url, icon: $icon, status: $status, type: $type, note: $note, nsfw: $nsfw, dailyLinkLimit: $dailyLinkLimit, dailyLinkUsed: $dailyLinkUsed, dailyBandwidthLimit: $dailyBandwidthLimit, dailyBandwidthUsed: $dailyBandwidthUsed, perLinkSizeLimit: $perLinkSizeLimit, regex: $regex)';
}


}

/// @nodoc
abstract mixin class _$HosterDataCopyWith<$Res> implements $HosterDataCopyWith<$Res> {
  factory _$HosterDataCopyWith(_HosterData value, $Res Function(_HosterData) _then) = __$HosterDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, List<String> domains, String url, String icon, bool status, String type, String? note, bool nsfw, int dailyLinkLimit, int dailyLinkUsed, int dailyBandwidthLimit, int dailyBandwidthUsed, int perLinkSizeLimit, String regex
});




}
/// @nodoc
class __$HosterDataCopyWithImpl<$Res>
    implements _$HosterDataCopyWith<$Res> {
  __$HosterDataCopyWithImpl(this._self, this._then);

  final _HosterData _self;
  final $Res Function(_HosterData) _then;

/// Create a copy of HosterData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? domains = null,Object? url = null,Object? icon = null,Object? status = null,Object? type = null,Object? note = freezed,Object? nsfw = null,Object? dailyLinkLimit = null,Object? dailyLinkUsed = null,Object? dailyBandwidthLimit = null,Object? dailyBandwidthUsed = null,Object? perLinkSizeLimit = null,Object? regex = null,}) {
  return _then(_HosterData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,domains: null == domains ? _self._domains : domains // ignore: cast_nullable_to_non_nullable
as List<String>,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,nsfw: null == nsfw ? _self.nsfw : nsfw // ignore: cast_nullable_to_non_nullable
as bool,dailyLinkLimit: null == dailyLinkLimit ? _self.dailyLinkLimit : dailyLinkLimit // ignore: cast_nullable_to_non_nullable
as int,dailyLinkUsed: null == dailyLinkUsed ? _self.dailyLinkUsed : dailyLinkUsed // ignore: cast_nullable_to_non_nullable
as int,dailyBandwidthLimit: null == dailyBandwidthLimit ? _self.dailyBandwidthLimit : dailyBandwidthLimit // ignore: cast_nullable_to_non_nullable
as int,dailyBandwidthUsed: null == dailyBandwidthUsed ? _self.dailyBandwidthUsed : dailyBandwidthUsed // ignore: cast_nullable_to_non_nullable
as int,perLinkSizeLimit: null == perLinkSizeLimit ? _self.perLinkSizeLimit : perLinkSizeLimit // ignore: cast_nullable_to_non_nullable
as int,regex: null == regex ? _self.regex : regex // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
