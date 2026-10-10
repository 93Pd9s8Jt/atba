// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'torrent_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TorrentData {

 int get id; String? get authId; int? get server; String? get hash; String? get name; String? get magnet; int? get size; bool? get active; String? get createdAt; String? get updatedAt; String? get downloadState; int? get seeds; int? get peers; double? get ratio; double? get progress; int? get downloadSpeed; int? get uploadSpeed; int? get eta; bool? get torrentFile; String? get expiresAt; bool? get downloadPresent; List<DownloadFileData>? get files; String? get downloadPath; double? get availability; bool? get downloadFinished; String? get tracker; int? get totalUploaded; int? get totalDownloaded; bool? get cached; String? get owner; bool? get seedTorrent; bool? get allowZipped; bool? get longTermSeeding; String? get trackerMessage; String? get cachedAt; bool? get private; List<String>? get alternativeHashes; List<String>? get tags; bool? get airlocked;
/// Create a copy of TorrentData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TorrentDataCopyWith<TorrentData> get copyWith => _$TorrentDataCopyWithImpl<TorrentData>(this as TorrentData, _$identity);

  /// Serializes this TorrentData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TorrentData&&(identical(other.id, id) || other.id == id)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.server, server) || other.server == server)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.name, name) || other.name == name)&&(identical(other.magnet, magnet) || other.magnet == magnet)&&(identical(other.size, size) || other.size == size)&&(identical(other.active, active) || other.active == active)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.downloadState, downloadState) || other.downloadState == downloadState)&&(identical(other.seeds, seeds) || other.seeds == seeds)&&(identical(other.peers, peers) || other.peers == peers)&&(identical(other.ratio, ratio) || other.ratio == ratio)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.downloadSpeed, downloadSpeed) || other.downloadSpeed == downloadSpeed)&&(identical(other.uploadSpeed, uploadSpeed) || other.uploadSpeed == uploadSpeed)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.torrentFile, torrentFile) || other.torrentFile == torrentFile)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.downloadPresent, downloadPresent) || other.downloadPresent == downloadPresent)&&const DeepCollectionEquality().equals(other.files, files)&&(identical(other.downloadPath, downloadPath) || other.downloadPath == downloadPath)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.downloadFinished, downloadFinished) || other.downloadFinished == downloadFinished)&&(identical(other.tracker, tracker) || other.tracker == tracker)&&(identical(other.totalUploaded, totalUploaded) || other.totalUploaded == totalUploaded)&&(identical(other.totalDownloaded, totalDownloaded) || other.totalDownloaded == totalDownloaded)&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.seedTorrent, seedTorrent) || other.seedTorrent == seedTorrent)&&(identical(other.allowZipped, allowZipped) || other.allowZipped == allowZipped)&&(identical(other.longTermSeeding, longTermSeeding) || other.longTermSeeding == longTermSeeding)&&(identical(other.trackerMessage, trackerMessage) || other.trackerMessage == trackerMessage)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt)&&(identical(other.private, private) || other.private == private)&&const DeepCollectionEquality().equals(other.alternativeHashes, alternativeHashes)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.airlocked, airlocked) || other.airlocked == airlocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,authId,server,hash,name,magnet,size,active,createdAt,updatedAt,downloadState,seeds,peers,ratio,progress,downloadSpeed,uploadSpeed,eta,torrentFile,expiresAt,downloadPresent,const DeepCollectionEquality().hash(files),downloadPath,availability,downloadFinished,tracker,totalUploaded,totalDownloaded,cached,owner,seedTorrent,allowZipped,longTermSeeding,trackerMessage,cachedAt,private,const DeepCollectionEquality().hash(alternativeHashes),const DeepCollectionEquality().hash(tags),airlocked]);

@override
String toString() {
  return 'TorrentData(id: $id, authId: $authId, server: $server, hash: $hash, name: $name, magnet: $magnet, size: $size, active: $active, createdAt: $createdAt, updatedAt: $updatedAt, downloadState: $downloadState, seeds: $seeds, peers: $peers, ratio: $ratio, progress: $progress, downloadSpeed: $downloadSpeed, uploadSpeed: $uploadSpeed, eta: $eta, torrentFile: $torrentFile, expiresAt: $expiresAt, downloadPresent: $downloadPresent, files: $files, downloadPath: $downloadPath, availability: $availability, downloadFinished: $downloadFinished, tracker: $tracker, totalUploaded: $totalUploaded, totalDownloaded: $totalDownloaded, cached: $cached, owner: $owner, seedTorrent: $seedTorrent, allowZipped: $allowZipped, longTermSeeding: $longTermSeeding, trackerMessage: $trackerMessage, cachedAt: $cachedAt, private: $private, alternativeHashes: $alternativeHashes, tags: $tags, airlocked: $airlocked)';
}


}

/// @nodoc
abstract mixin class $TorrentDataCopyWith<$Res>  {
  factory $TorrentDataCopyWith(TorrentData value, $Res Function(TorrentData) _then) = _$TorrentDataCopyWithImpl;
@useResult
$Res call({
 int id, String? authId, int? server, String? hash, String? name, String? magnet, int? size, bool? active, String? createdAt, String? updatedAt, String? downloadState, int? seeds, int? peers, double? ratio, double? progress, int? downloadSpeed, int? uploadSpeed, int? eta, bool? torrentFile, String? expiresAt, bool? downloadPresent, List<DownloadFileData>? files, String? downloadPath, double? availability, bool? downloadFinished, String? tracker, int? totalUploaded, int? totalDownloaded, bool? cached, String? owner, bool? seedTorrent, bool? allowZipped, bool? longTermSeeding, String? trackerMessage, String? cachedAt, bool? private, List<String>? alternativeHashes, List<String>? tags, bool? airlocked
});




}
/// @nodoc
class _$TorrentDataCopyWithImpl<$Res>
    implements $TorrentDataCopyWith<$Res> {
  _$TorrentDataCopyWithImpl(this._self, this._then);

  final TorrentData _self;
  final $Res Function(TorrentData) _then;

/// Create a copy of TorrentData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authId = freezed,Object? server = freezed,Object? hash = freezed,Object? name = freezed,Object? magnet = freezed,Object? size = freezed,Object? active = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? downloadState = freezed,Object? seeds = freezed,Object? peers = freezed,Object? ratio = freezed,Object? progress = freezed,Object? downloadSpeed = freezed,Object? uploadSpeed = freezed,Object? eta = freezed,Object? torrentFile = freezed,Object? expiresAt = freezed,Object? downloadPresent = freezed,Object? files = freezed,Object? downloadPath = freezed,Object? availability = freezed,Object? downloadFinished = freezed,Object? tracker = freezed,Object? totalUploaded = freezed,Object? totalDownloaded = freezed,Object? cached = freezed,Object? owner = freezed,Object? seedTorrent = freezed,Object? allowZipped = freezed,Object? longTermSeeding = freezed,Object? trackerMessage = freezed,Object? cachedAt = freezed,Object? private = freezed,Object? alternativeHashes = freezed,Object? tags = freezed,Object? airlocked = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,authId: freezed == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String?,server: freezed == server ? _self.server : server // ignore: cast_nullable_to_non_nullable
as int?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,magnet: freezed == magnet ? _self.magnet : magnet // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,downloadState: freezed == downloadState ? _self.downloadState : downloadState // ignore: cast_nullable_to_non_nullable
as String?,seeds: freezed == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as int?,peers: freezed == peers ? _self.peers : peers // ignore: cast_nullable_to_non_nullable
as int?,ratio: freezed == ratio ? _self.ratio : ratio // ignore: cast_nullable_to_non_nullable
as double?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,downloadSpeed: freezed == downloadSpeed ? _self.downloadSpeed : downloadSpeed // ignore: cast_nullable_to_non_nullable
as int?,uploadSpeed: freezed == uploadSpeed ? _self.uploadSpeed : uploadSpeed // ignore: cast_nullable_to_non_nullable
as int?,eta: freezed == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as int?,torrentFile: freezed == torrentFile ? _self.torrentFile : torrentFile // ignore: cast_nullable_to_non_nullable
as bool?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,downloadPresent: freezed == downloadPresent ? _self.downloadPresent : downloadPresent // ignore: cast_nullable_to_non_nullable
as bool?,files: freezed == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<DownloadFileData>?,downloadPath: freezed == downloadPath ? _self.downloadPath : downloadPath // ignore: cast_nullable_to_non_nullable
as String?,availability: freezed == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as double?,downloadFinished: freezed == downloadFinished ? _self.downloadFinished : downloadFinished // ignore: cast_nullable_to_non_nullable
as bool?,tracker: freezed == tracker ? _self.tracker : tracker // ignore: cast_nullable_to_non_nullable
as String?,totalUploaded: freezed == totalUploaded ? _self.totalUploaded : totalUploaded // ignore: cast_nullable_to_non_nullable
as int?,totalDownloaded: freezed == totalDownloaded ? _self.totalDownloaded : totalDownloaded // ignore: cast_nullable_to_non_nullable
as int?,cached: freezed == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String?,seedTorrent: freezed == seedTorrent ? _self.seedTorrent : seedTorrent // ignore: cast_nullable_to_non_nullable
as bool?,allowZipped: freezed == allowZipped ? _self.allowZipped : allowZipped // ignore: cast_nullable_to_non_nullable
as bool?,longTermSeeding: freezed == longTermSeeding ? _self.longTermSeeding : longTermSeeding // ignore: cast_nullable_to_non_nullable
as bool?,trackerMessage: freezed == trackerMessage ? _self.trackerMessage : trackerMessage // ignore: cast_nullable_to_non_nullable
as String?,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as String?,private: freezed == private ? _self.private : private // ignore: cast_nullable_to_non_nullable
as bool?,alternativeHashes: freezed == alternativeHashes ? _self.alternativeHashes : alternativeHashes // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,airlocked: freezed == airlocked ? _self.airlocked : airlocked // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [TorrentData].
extension TorrentDataPatterns on TorrentData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TorrentData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TorrentData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TorrentData value)  $default,){
final _that = this;
switch (_that) {
case _TorrentData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TorrentData value)?  $default,){
final _that = this;
switch (_that) {
case _TorrentData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? authId,  int? server,  String? hash,  String? name,  String? magnet,  int? size,  bool? active,  String? createdAt,  String? updatedAt,  String? downloadState,  int? seeds,  int? peers,  double? ratio,  double? progress,  int? downloadSpeed,  int? uploadSpeed,  int? eta,  bool? torrentFile,  String? expiresAt,  bool? downloadPresent,  List<DownloadFileData>? files,  String? downloadPath,  double? availability,  bool? downloadFinished,  String? tracker,  int? totalUploaded,  int? totalDownloaded,  bool? cached,  String? owner,  bool? seedTorrent,  bool? allowZipped,  bool? longTermSeeding,  String? trackerMessage,  String? cachedAt,  bool? private,  List<String>? alternativeHashes,  List<String>? tags,  bool? airlocked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TorrentData() when $default != null:
return $default(_that.id,_that.authId,_that.server,_that.hash,_that.name,_that.magnet,_that.size,_that.active,_that.createdAt,_that.updatedAt,_that.downloadState,_that.seeds,_that.peers,_that.ratio,_that.progress,_that.downloadSpeed,_that.uploadSpeed,_that.eta,_that.torrentFile,_that.expiresAt,_that.downloadPresent,_that.files,_that.downloadPath,_that.availability,_that.downloadFinished,_that.tracker,_that.totalUploaded,_that.totalDownloaded,_that.cached,_that.owner,_that.seedTorrent,_that.allowZipped,_that.longTermSeeding,_that.trackerMessage,_that.cachedAt,_that.private,_that.alternativeHashes,_that.tags,_that.airlocked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? authId,  int? server,  String? hash,  String? name,  String? magnet,  int? size,  bool? active,  String? createdAt,  String? updatedAt,  String? downloadState,  int? seeds,  int? peers,  double? ratio,  double? progress,  int? downloadSpeed,  int? uploadSpeed,  int? eta,  bool? torrentFile,  String? expiresAt,  bool? downloadPresent,  List<DownloadFileData>? files,  String? downloadPath,  double? availability,  bool? downloadFinished,  String? tracker,  int? totalUploaded,  int? totalDownloaded,  bool? cached,  String? owner,  bool? seedTorrent,  bool? allowZipped,  bool? longTermSeeding,  String? trackerMessage,  String? cachedAt,  bool? private,  List<String>? alternativeHashes,  List<String>? tags,  bool? airlocked)  $default,) {final _that = this;
switch (_that) {
case _TorrentData():
return $default(_that.id,_that.authId,_that.server,_that.hash,_that.name,_that.magnet,_that.size,_that.active,_that.createdAt,_that.updatedAt,_that.downloadState,_that.seeds,_that.peers,_that.ratio,_that.progress,_that.downloadSpeed,_that.uploadSpeed,_that.eta,_that.torrentFile,_that.expiresAt,_that.downloadPresent,_that.files,_that.downloadPath,_that.availability,_that.downloadFinished,_that.tracker,_that.totalUploaded,_that.totalDownloaded,_that.cached,_that.owner,_that.seedTorrent,_that.allowZipped,_that.longTermSeeding,_that.trackerMessage,_that.cachedAt,_that.private,_that.alternativeHashes,_that.tags,_that.airlocked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? authId,  int? server,  String? hash,  String? name,  String? magnet,  int? size,  bool? active,  String? createdAt,  String? updatedAt,  String? downloadState,  int? seeds,  int? peers,  double? ratio,  double? progress,  int? downloadSpeed,  int? uploadSpeed,  int? eta,  bool? torrentFile,  String? expiresAt,  bool? downloadPresent,  List<DownloadFileData>? files,  String? downloadPath,  double? availability,  bool? downloadFinished,  String? tracker,  int? totalUploaded,  int? totalDownloaded,  bool? cached,  String? owner,  bool? seedTorrent,  bool? allowZipped,  bool? longTermSeeding,  String? trackerMessage,  String? cachedAt,  bool? private,  List<String>? alternativeHashes,  List<String>? tags,  bool? airlocked)?  $default,) {final _that = this;
switch (_that) {
case _TorrentData() when $default != null:
return $default(_that.id,_that.authId,_that.server,_that.hash,_that.name,_that.magnet,_that.size,_that.active,_that.createdAt,_that.updatedAt,_that.downloadState,_that.seeds,_that.peers,_that.ratio,_that.progress,_that.downloadSpeed,_that.uploadSpeed,_that.eta,_that.torrentFile,_that.expiresAt,_that.downloadPresent,_that.files,_that.downloadPath,_that.availability,_that.downloadFinished,_that.tracker,_that.totalUploaded,_that.totalDownloaded,_that.cached,_that.owner,_that.seedTorrent,_that.allowZipped,_that.longTermSeeding,_that.trackerMessage,_that.cachedAt,_that.private,_that.alternativeHashes,_that.tags,_that.airlocked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TorrentData implements TorrentData {
  const _TorrentData({required this.id, this.authId, this.server, this.hash, this.name, this.magnet, this.size, this.active, this.createdAt, this.updatedAt, this.downloadState, this.seeds, this.peers, this.ratio, this.progress, this.downloadSpeed, this.uploadSpeed, this.eta, this.torrentFile, this.expiresAt, this.downloadPresent, final  List<DownloadFileData>? files, this.downloadPath, this.availability, this.downloadFinished, this.tracker, this.totalUploaded, this.totalDownloaded, this.cached, this.owner, this.seedTorrent, this.allowZipped, this.longTermSeeding, this.trackerMessage, this.cachedAt, this.private, final  List<String>? alternativeHashes, final  List<String>? tags, this.airlocked}): _files = files,_alternativeHashes = alternativeHashes,_tags = tags;
  factory _TorrentData.fromJson(Map<String, dynamic> json) => _$TorrentDataFromJson(json);

@override final  int id;
@override final  String? authId;
@override final  int? server;
@override final  String? hash;
@override final  String? name;
@override final  String? magnet;
@override final  int? size;
@override final  bool? active;
@override final  String? createdAt;
@override final  String? updatedAt;
@override final  String? downloadState;
@override final  int? seeds;
@override final  int? peers;
@override final  double? ratio;
@override final  double? progress;
@override final  int? downloadSpeed;
@override final  int? uploadSpeed;
@override final  int? eta;
@override final  bool? torrentFile;
@override final  String? expiresAt;
@override final  bool? downloadPresent;
 final  List<DownloadFileData>? _files;
@override List<DownloadFileData>? get files {
  final value = _files;
  if (value == null) return null;
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? downloadPath;
@override final  double? availability;
@override final  bool? downloadFinished;
@override final  String? tracker;
@override final  int? totalUploaded;
@override final  int? totalDownloaded;
@override final  bool? cached;
@override final  String? owner;
@override final  bool? seedTorrent;
@override final  bool? allowZipped;
@override final  bool? longTermSeeding;
@override final  String? trackerMessage;
@override final  String? cachedAt;
@override final  bool? private;
 final  List<String>? _alternativeHashes;
@override List<String>? get alternativeHashes {
  final value = _alternativeHashes;
  if (value == null) return null;
  if (_alternativeHashes is EqualUnmodifiableListView) return _alternativeHashes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? airlocked;

/// Create a copy of TorrentData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TorrentDataCopyWith<_TorrentData> get copyWith => __$TorrentDataCopyWithImpl<_TorrentData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TorrentDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TorrentData&&(identical(other.id, id) || other.id == id)&&(identical(other.authId, authId) || other.authId == authId)&&(identical(other.server, server) || other.server == server)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.name, name) || other.name == name)&&(identical(other.magnet, magnet) || other.magnet == magnet)&&(identical(other.size, size) || other.size == size)&&(identical(other.active, active) || other.active == active)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.downloadState, downloadState) || other.downloadState == downloadState)&&(identical(other.seeds, seeds) || other.seeds == seeds)&&(identical(other.peers, peers) || other.peers == peers)&&(identical(other.ratio, ratio) || other.ratio == ratio)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.downloadSpeed, downloadSpeed) || other.downloadSpeed == downloadSpeed)&&(identical(other.uploadSpeed, uploadSpeed) || other.uploadSpeed == uploadSpeed)&&(identical(other.eta, eta) || other.eta == eta)&&(identical(other.torrentFile, torrentFile) || other.torrentFile == torrentFile)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.downloadPresent, downloadPresent) || other.downloadPresent == downloadPresent)&&const DeepCollectionEquality().equals(other._files, _files)&&(identical(other.downloadPath, downloadPath) || other.downloadPath == downloadPath)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.downloadFinished, downloadFinished) || other.downloadFinished == downloadFinished)&&(identical(other.tracker, tracker) || other.tracker == tracker)&&(identical(other.totalUploaded, totalUploaded) || other.totalUploaded == totalUploaded)&&(identical(other.totalDownloaded, totalDownloaded) || other.totalDownloaded == totalDownloaded)&&(identical(other.cached, cached) || other.cached == cached)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.seedTorrent, seedTorrent) || other.seedTorrent == seedTorrent)&&(identical(other.allowZipped, allowZipped) || other.allowZipped == allowZipped)&&(identical(other.longTermSeeding, longTermSeeding) || other.longTermSeeding == longTermSeeding)&&(identical(other.trackerMessage, trackerMessage) || other.trackerMessage == trackerMessage)&&(identical(other.cachedAt, cachedAt) || other.cachedAt == cachedAt)&&(identical(other.private, private) || other.private == private)&&const DeepCollectionEquality().equals(other._alternativeHashes, _alternativeHashes)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.airlocked, airlocked) || other.airlocked == airlocked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,authId,server,hash,name,magnet,size,active,createdAt,updatedAt,downloadState,seeds,peers,ratio,progress,downloadSpeed,uploadSpeed,eta,torrentFile,expiresAt,downloadPresent,const DeepCollectionEquality().hash(_files),downloadPath,availability,downloadFinished,tracker,totalUploaded,totalDownloaded,cached,owner,seedTorrent,allowZipped,longTermSeeding,trackerMessage,cachedAt,private,const DeepCollectionEquality().hash(_alternativeHashes),const DeepCollectionEquality().hash(_tags),airlocked]);

@override
String toString() {
  return 'TorrentData(id: $id, authId: $authId, server: $server, hash: $hash, name: $name, magnet: $magnet, size: $size, active: $active, createdAt: $createdAt, updatedAt: $updatedAt, downloadState: $downloadState, seeds: $seeds, peers: $peers, ratio: $ratio, progress: $progress, downloadSpeed: $downloadSpeed, uploadSpeed: $uploadSpeed, eta: $eta, torrentFile: $torrentFile, expiresAt: $expiresAt, downloadPresent: $downloadPresent, files: $files, downloadPath: $downloadPath, availability: $availability, downloadFinished: $downloadFinished, tracker: $tracker, totalUploaded: $totalUploaded, totalDownloaded: $totalDownloaded, cached: $cached, owner: $owner, seedTorrent: $seedTorrent, allowZipped: $allowZipped, longTermSeeding: $longTermSeeding, trackerMessage: $trackerMessage, cachedAt: $cachedAt, private: $private, alternativeHashes: $alternativeHashes, tags: $tags, airlocked: $airlocked)';
}


}

/// @nodoc
abstract mixin class _$TorrentDataCopyWith<$Res> implements $TorrentDataCopyWith<$Res> {
  factory _$TorrentDataCopyWith(_TorrentData value, $Res Function(_TorrentData) _then) = __$TorrentDataCopyWithImpl;
@override @useResult
$Res call({
 int id, String? authId, int? server, String? hash, String? name, String? magnet, int? size, bool? active, String? createdAt, String? updatedAt, String? downloadState, int? seeds, int? peers, double? ratio, double? progress, int? downloadSpeed, int? uploadSpeed, int? eta, bool? torrentFile, String? expiresAt, bool? downloadPresent, List<DownloadFileData>? files, String? downloadPath, double? availability, bool? downloadFinished, String? tracker, int? totalUploaded, int? totalDownloaded, bool? cached, String? owner, bool? seedTorrent, bool? allowZipped, bool? longTermSeeding, String? trackerMessage, String? cachedAt, bool? private, List<String>? alternativeHashes, List<String>? tags, bool? airlocked
});




}
/// @nodoc
class __$TorrentDataCopyWithImpl<$Res>
    implements _$TorrentDataCopyWith<$Res> {
  __$TorrentDataCopyWithImpl(this._self, this._then);

  final _TorrentData _self;
  final $Res Function(_TorrentData) _then;

/// Create a copy of TorrentData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authId = freezed,Object? server = freezed,Object? hash = freezed,Object? name = freezed,Object? magnet = freezed,Object? size = freezed,Object? active = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? downloadState = freezed,Object? seeds = freezed,Object? peers = freezed,Object? ratio = freezed,Object? progress = freezed,Object? downloadSpeed = freezed,Object? uploadSpeed = freezed,Object? eta = freezed,Object? torrentFile = freezed,Object? expiresAt = freezed,Object? downloadPresent = freezed,Object? files = freezed,Object? downloadPath = freezed,Object? availability = freezed,Object? downloadFinished = freezed,Object? tracker = freezed,Object? totalUploaded = freezed,Object? totalDownloaded = freezed,Object? cached = freezed,Object? owner = freezed,Object? seedTorrent = freezed,Object? allowZipped = freezed,Object? longTermSeeding = freezed,Object? trackerMessage = freezed,Object? cachedAt = freezed,Object? private = freezed,Object? alternativeHashes = freezed,Object? tags = freezed,Object? airlocked = freezed,}) {
  return _then(_TorrentData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,authId: freezed == authId ? _self.authId : authId // ignore: cast_nullable_to_non_nullable
as String?,server: freezed == server ? _self.server : server // ignore: cast_nullable_to_non_nullable
as int?,hash: freezed == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,magnet: freezed == magnet ? _self.magnet : magnet // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,downloadState: freezed == downloadState ? _self.downloadState : downloadState // ignore: cast_nullable_to_non_nullable
as String?,seeds: freezed == seeds ? _self.seeds : seeds // ignore: cast_nullable_to_non_nullable
as int?,peers: freezed == peers ? _self.peers : peers // ignore: cast_nullable_to_non_nullable
as int?,ratio: freezed == ratio ? _self.ratio : ratio // ignore: cast_nullable_to_non_nullable
as double?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,downloadSpeed: freezed == downloadSpeed ? _self.downloadSpeed : downloadSpeed // ignore: cast_nullable_to_non_nullable
as int?,uploadSpeed: freezed == uploadSpeed ? _self.uploadSpeed : uploadSpeed // ignore: cast_nullable_to_non_nullable
as int?,eta: freezed == eta ? _self.eta : eta // ignore: cast_nullable_to_non_nullable
as int?,torrentFile: freezed == torrentFile ? _self.torrentFile : torrentFile // ignore: cast_nullable_to_non_nullable
as bool?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,downloadPresent: freezed == downloadPresent ? _self.downloadPresent : downloadPresent // ignore: cast_nullable_to_non_nullable
as bool?,files: freezed == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<DownloadFileData>?,downloadPath: freezed == downloadPath ? _self.downloadPath : downloadPath // ignore: cast_nullable_to_non_nullable
as String?,availability: freezed == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as double?,downloadFinished: freezed == downloadFinished ? _self.downloadFinished : downloadFinished // ignore: cast_nullable_to_non_nullable
as bool?,tracker: freezed == tracker ? _self.tracker : tracker // ignore: cast_nullable_to_non_nullable
as String?,totalUploaded: freezed == totalUploaded ? _self.totalUploaded : totalUploaded // ignore: cast_nullable_to_non_nullable
as int?,totalDownloaded: freezed == totalDownloaded ? _self.totalDownloaded : totalDownloaded // ignore: cast_nullable_to_non_nullable
as int?,cached: freezed == cached ? _self.cached : cached // ignore: cast_nullable_to_non_nullable
as bool?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String?,seedTorrent: freezed == seedTorrent ? _self.seedTorrent : seedTorrent // ignore: cast_nullable_to_non_nullable
as bool?,allowZipped: freezed == allowZipped ? _self.allowZipped : allowZipped // ignore: cast_nullable_to_non_nullable
as bool?,longTermSeeding: freezed == longTermSeeding ? _self.longTermSeeding : longTermSeeding // ignore: cast_nullable_to_non_nullable
as bool?,trackerMessage: freezed == trackerMessage ? _self.trackerMessage : trackerMessage // ignore: cast_nullable_to_non_nullable
as String?,cachedAt: freezed == cachedAt ? _self.cachedAt : cachedAt // ignore: cast_nullable_to_non_nullable
as String?,private: freezed == private ? _self.private : private // ignore: cast_nullable_to_non_nullable
as bool?,alternativeHashes: freezed == alternativeHashes ? _self._alternativeHashes : alternativeHashes // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,airlocked: freezed == airlocked ? _self.airlocked : airlocked // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
