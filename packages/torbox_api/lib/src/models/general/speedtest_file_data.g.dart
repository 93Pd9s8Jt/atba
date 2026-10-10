// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speedtest_file_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpeedtestFileData _$SpeedtestFileDataFromJson(Map<String, dynamic> json) =>
    _SpeedtestFileData(
      region: json['region'] as String,
      name: json['name'] as String,
      domain: json['domain'] as String,
      path: json['path'] as String,
      url: json['url'] as String,
      closest: json['closest'] as bool,
      coordinates: SpeedtestCoordinates.fromJson(
        json['coordinates'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$SpeedtestFileDataToJson(_SpeedtestFileData instance) =>
    <String, dynamic>{
      'region': instance.region,
      'name': instance.name,
      'domain': instance.domain,
      'path': instance.path,
      'url': instance.url,
      'closest': instance.closest,
      'coordinates': instance.coordinates.toJson(),
    };

_SpeedtestCoordinates _$SpeedtestCoordinatesFromJson(
  Map<String, dynamic> json,
) => _SpeedtestCoordinates(
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
);

Map<String, dynamic> _$SpeedtestCoordinatesToJson(
  _SpeedtestCoordinates instance,
) => <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};
