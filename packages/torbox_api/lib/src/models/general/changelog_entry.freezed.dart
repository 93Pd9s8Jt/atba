// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'changelog_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangelogEntry {

 String get name; String get html; String get markdown; String get link; String get createdAt; String get id;
/// Create a copy of ChangelogEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangelogEntryCopyWith<ChangelogEntry> get copyWith => _$ChangelogEntryCopyWithImpl<ChangelogEntry>(this as ChangelogEntry, _$identity);

  /// Serializes this ChangelogEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangelogEntry&&(identical(other.name, name) || other.name == name)&&(identical(other.html, html) || other.html == html)&&(identical(other.markdown, markdown) || other.markdown == markdown)&&(identical(other.link, link) || other.link == link)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,html,markdown,link,createdAt,id);

@override
String toString() {
  return 'ChangelogEntry(name: $name, html: $html, markdown: $markdown, link: $link, createdAt: $createdAt, id: $id)';
}


}

/// @nodoc
abstract mixin class $ChangelogEntryCopyWith<$Res>  {
  factory $ChangelogEntryCopyWith(ChangelogEntry value, $Res Function(ChangelogEntry) _then) = _$ChangelogEntryCopyWithImpl;
@useResult
$Res call({
 String name, String html, String markdown, String link, String createdAt, String id
});




}
/// @nodoc
class _$ChangelogEntryCopyWithImpl<$Res>
    implements $ChangelogEntryCopyWith<$Res> {
  _$ChangelogEntryCopyWithImpl(this._self, this._then);

  final ChangelogEntry _self;
  final $Res Function(ChangelogEntry) _then;

/// Create a copy of ChangelogEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? html = null,Object? markdown = null,Object? link = null,Object? createdAt = null,Object? id = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,html: null == html ? _self.html : html // ignore: cast_nullable_to_non_nullable
as String,markdown: null == markdown ? _self.markdown : markdown // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangelogEntry].
extension ChangelogEntryPatterns on ChangelogEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangelogEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangelogEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangelogEntry value)  $default,){
final _that = this;
switch (_that) {
case _ChangelogEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangelogEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ChangelogEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String html,  String markdown,  String link,  String createdAt,  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangelogEntry() when $default != null:
return $default(_that.name,_that.html,_that.markdown,_that.link,_that.createdAt,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String html,  String markdown,  String link,  String createdAt,  String id)  $default,) {final _that = this;
switch (_that) {
case _ChangelogEntry():
return $default(_that.name,_that.html,_that.markdown,_that.link,_that.createdAt,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String html,  String markdown,  String link,  String createdAt,  String id)?  $default,) {final _that = this;
switch (_that) {
case _ChangelogEntry() when $default != null:
return $default(_that.name,_that.html,_that.markdown,_that.link,_that.createdAt,_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangelogEntry implements ChangelogEntry {
  const _ChangelogEntry({required this.name, required this.html, required this.markdown, required this.link, required this.createdAt, required this.id});
  factory _ChangelogEntry.fromJson(Map<String, dynamic> json) => _$ChangelogEntryFromJson(json);

@override final  String name;
@override final  String html;
@override final  String markdown;
@override final  String link;
@override final  String createdAt;
@override final  String id;

/// Create a copy of ChangelogEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangelogEntryCopyWith<_ChangelogEntry> get copyWith => __$ChangelogEntryCopyWithImpl<_ChangelogEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangelogEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangelogEntry&&(identical(other.name, name) || other.name == name)&&(identical(other.html, html) || other.html == html)&&(identical(other.markdown, markdown) || other.markdown == markdown)&&(identical(other.link, link) || other.link == link)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,html,markdown,link,createdAt,id);

@override
String toString() {
  return 'ChangelogEntry(name: $name, html: $html, markdown: $markdown, link: $link, createdAt: $createdAt, id: $id)';
}


}

/// @nodoc
abstract mixin class _$ChangelogEntryCopyWith<$Res> implements $ChangelogEntryCopyWith<$Res> {
  factory _$ChangelogEntryCopyWith(_ChangelogEntry value, $Res Function(_ChangelogEntry) _then) = __$ChangelogEntryCopyWithImpl;
@override @useResult
$Res call({
 String name, String html, String markdown, String link, String createdAt, String id
});




}
/// @nodoc
class __$ChangelogEntryCopyWithImpl<$Res>
    implements _$ChangelogEntryCopyWith<$Res> {
  __$ChangelogEntryCopyWithImpl(this._self, this._then);

  final _ChangelogEntry _self;
  final $Res Function(_ChangelogEntry) _then;

/// Create a copy of ChangelogEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? html = null,Object? markdown = null,Object? link = null,Object? createdAt = null,Object? id = null,}) {
  return _then(_ChangelogEntry(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,html: null == html ? _self.html : html // ignore: cast_nullable_to_non_nullable
as String,markdown: null == markdown ? _self.markdown : markdown // ignore: cast_nullable_to_non_nullable
as String,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
