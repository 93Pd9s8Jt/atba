// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'integration_job_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IntegrationJobData {

 int get id; String get createdAt; String get updatedAt; String get authId; String get hash; String get type; String get integration; int? get fileId; bool get zip; double get progress; String get detail;/// Populated once the transfer completes.
 String? get downloadUrl; String get status; String get fileName;/// Returned by the list endpoints.
@JsonKey(name: 'task_id') String? get taskId;/// Returned by the single-job endpoint.
@JsonKey(name: 'job_id') String? get jobId;
/// Create a copy of IntegrationJobData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IntegrationJobDataCopyWith<IntegrationJobData> get copyWith => _$IntegrationJobDataCopyWithImpl<IntegrationJobData>(this as IntegrationJobData, _$identity);

  /// Serializes this IntegrationJobData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IntegrationJobData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.type, type) || other.type == type)&&(identical(other.integration, integration) || other.integration == integration)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.zip, zip) || other.zip == zip)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.jobId, jobId) || other.jobId == jobId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,authId,hash,type,integration,fileId,zip,progress,detail,downloadUrl,status,fileName,taskId,jobId);

@override
String toString() {
  return 'IntegrationJobData(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, authId: $authId, hash: $hash, type: $type, integration: $integration, fileId: $fileId, zip: $zip, progress: $progress, detail: $detail, downloadUrl: $downloadUrl, status: $status, fileName: $fileName, taskId: $taskId, jobId: $jobId)';
}


}

/// @nodoc
abstract mixin class $IntegrationJobDataCopyWith<$Res>  {
  factory $IntegrationJobDataCopyWith(IntegrationJobData value, $Res Function(IntegrationJobData) _then) = _$IntegrationJobDataCopyWithImpl;
@useResult
$Res call({
 int id, String createdAt, String updatedAt, String authId, String hash, String type, String integration, int? fileId, bool zip, double progress, String detail, String? downloadUrl, String status, String fileName,@JsonKey(name: 'task_id') String? taskId,@JsonKey(name: 'job_id') String? jobId
});




}
/// @nodoc
class _$IntegrationJobDataCopyWithImpl<$Res>
    implements $IntegrationJobDataCopyWith<$Res> {
  _$IntegrationJobDataCopyWithImpl(this._self, this._then);

  final IntegrationJobData _self;
  final $Res Function(IntegrationJobData) _then;

/// Create a copy of IntegrationJobData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? authId = null,Object? hash = null,Object? type = null,Object? integration = null,Object? fileId = freezed,Object? zip = null,Object? progress = null,Object? detail = null,Object? downloadUrl = freezed,Object? status = null,Object? fileName = null,Object? taskId = freezed,Object? jobId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,integration: null == integration ? _self.integration : integration // ignore: cast_nullable_to_non_nullable
as String,fileId: freezed == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as int?,zip: null == zip ? _self.zip : zip // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,downloadUrl: freezed == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IntegrationJobData].
extension IntegrationJobDataPatterns on IntegrationJobData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IntegrationJobData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IntegrationJobData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IntegrationJobData value)  $default,){
final _that = this;
switch (_that) {
case _IntegrationJobData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IntegrationJobData value)?  $default,){
final _that = this;
switch (_that) {
case _IntegrationJobData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String createdAt,  String updatedAt,  String authId,  String hash,  String type,  String integration,  int? fileId,  bool zip,  double progress,  String detail,  String? downloadUrl,  String status,  String fileName, @JsonKey(name: 'task_id')  String? taskId, @JsonKey(name: 'job_id')  String? jobId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IntegrationJobData() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.authId,_that.hash,_that.type,_that.integration,_that.fileId,_that.zip,_that.progress,_that.detail,_that.downloadUrl,_that.status,_that.fileName,_that.taskId,_that.jobId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String createdAt,  String updatedAt,  String authId,  String hash,  String type,  String integration,  int? fileId,  bool zip,  double progress,  String detail,  String? downloadUrl,  String status,  String fileName, @JsonKey(name: 'task_id')  String? taskId, @JsonKey(name: 'job_id')  String? jobId)  $default,) {final _that = this;
switch (_that) {
case _IntegrationJobData():
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.authId,_that.hash,_that.type,_that.integration,_that.fileId,_that.zip,_that.progress,_that.detail,_that.downloadUrl,_that.status,_that.fileName,_that.taskId,_that.jobId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String createdAt,  String updatedAt,  String authId,  String hash,  String type,  String integration,  int? fileId,  bool zip,  double progress,  String detail,  String? downloadUrl,  String status,  String fileName, @JsonKey(name: 'task_id')  String? taskId, @JsonKey(name: 'job_id')  String? jobId)?  $default,) {final _that = this;
switch (_that) {
case _IntegrationJobData() when $default != null:
return $default(_that.id,_that.createdAt,_that.updatedAt,_that.authId,_that.hash,_that.type,_that.integration,_that.fileId,_that.zip,_that.progress,_that.detail,_that.downloadUrl,_that.status,_that.fileName,_that.taskId,_that.jobId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IntegrationJobData implements IntegrationJobData {
  const _IntegrationJobData({required this.id, required this.createdAt, required this.updatedAt, required this.authId, required this.hash, required this.type, required this.integration, this.fileId, required this.zip, required this.progress, required this.detail, this.downloadUrl, required this.status, required this.fileName, @JsonKey(name: 'task_id') this.taskId, @JsonKey(name: 'job_id') this.jobId});
  factory _IntegrationJobData.fromJson(Map<String, dynamic> json) => _$IntegrationJobDataFromJson(json);

@override final  int id;
@override final  String createdAt;
@override final  String updatedAt;
@override final  String authId;
@override final  String hash;
@override final  String type;
@override final  String integration;
@override final  int? fileId;
@override final  bool zip;
@override final  double progress;
@override final  String detail;
/// Populated once the transfer completes.
@override final  String? downloadUrl;
@override final  String status;
@override final  String fileName;
/// Returned by the list endpoints.
@override@JsonKey(name: 'task_id') final  String? taskId;
/// Returned by the single-job endpoint.
@override@JsonKey(name: 'job_id') final  String? jobId;

/// Create a copy of IntegrationJobData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IntegrationJobDataCopyWith<_IntegrationJobData> get copyWith => __$IntegrationJobDataCopyWithImpl<_IntegrationJobData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IntegrationJobDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IntegrationJobData&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.type, type) || other.type == type)&&(identical(other.integration, integration) || other.integration == integration)&&(identical(other.fileId, fileId) || other.fileId == fileId)&&(identical(other.zip, zip) || other.zip == zip)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.downloadUrl, downloadUrl) || other.downloadUrl == downloadUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.jobId, jobId) || other.jobId == jobId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,updatedAt,authId,hash,type,integration,fileId,zip,progress,detail,downloadUrl,status,fileName,taskId,jobId);

@override
String toString() {
  return 'IntegrationJobData(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, authId: $authId, hash: $hash, type: $type, integration: $integration, fileId: $fileId, zip: $zip, progress: $progress, detail: $detail, downloadUrl: $downloadUrl, status: $status, fileName: $fileName, taskId: $taskId, jobId: $jobId)';
}


}

/// @nodoc
abstract mixin class _$IntegrationJobDataCopyWith<$Res> implements $IntegrationJobDataCopyWith<$Res> {
  factory _$IntegrationJobDataCopyWith(_IntegrationJobData value, $Res Function(_IntegrationJobData) _then) = __$IntegrationJobDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String createdAt, String updatedAt, String authId, String hash, String type, String integration, int? fileId, bool zip, double progress, String detail, String? downloadUrl, String status, String fileName,@JsonKey(name: 'task_id') String? taskId,@JsonKey(name: 'job_id') String? jobId
});




}
/// @nodoc
class __$IntegrationJobDataCopyWithImpl<$Res>
    implements _$IntegrationJobDataCopyWith<$Res> {
  __$IntegrationJobDataCopyWithImpl(this._self, this._then);

  final _IntegrationJobData _self;
  final $Res Function(_IntegrationJobData) _then;

/// Create a copy of IntegrationJobData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? updatedAt = null,Object? authId = null,Object? hash = null,Object? type = null,Object? integration = null,Object? fileId = freezed,Object? zip = null,Object? progress = null,Object? detail = null,Object? downloadUrl = freezed,Object? status = null,Object? fileName = null,Object? taskId = freezed,Object? jobId = freezed,}) {
  return _then(_IntegrationJobData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,authId: null == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,integration: null == integration ? _self.integration : integration // ignore: cast_nullable_to_non_nullable
as String,fileId: freezed == fileId ? _self.fileId : fileId // ignore: cast_nullable_to_non_nullable
as int?,zip: null == zip ? _self.zip : zip // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,downloadUrl: freezed == downloadUrl ? _self.downloadUrl : downloadUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
