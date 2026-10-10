// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changelog_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChangelogEntry _$ChangelogEntryFromJson(Map<String, dynamic> json) =>
    _ChangelogEntry(
      name: json['name'] as String,
      html: json['html'] as String,
      markdown: json['markdown'] as String,
      link: json['link'] as String,
      createdAt: json['created_at'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ChangelogEntryToJson(_ChangelogEntry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'html': instance.html,
      'markdown': instance.markdown,
      'link': instance.link,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
