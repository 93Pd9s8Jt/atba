import 'package:json_annotation/json_annotation.dart';

part 'custom_addon.g.dart';

@JsonSerializable()
class CustomAddon {
  final String name;
  final String url;

  CustomAddon({required this.name, required this.url});

  factory CustomAddon.fromJson(Map<String, dynamic> json) =>
      _$CustomAddonFromJson(json);

  Map<String, dynamic> toJson() => _$CustomAddonToJson(this);
}
