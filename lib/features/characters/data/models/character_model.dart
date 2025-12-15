import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  final int id;
  final String name;
  final String species;
  final String image;

  final OriginModel origin;
  final LocationModel location;

  @JsonKey(name: 'episode')
  final List<String> episodes;

  CharacterModel({
    required this.id,
    required this.name,
    required this.species,
    required this.image,
    required this.origin,
    required this.location,
    required this.episodes,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

@JsonSerializable()
class OriginModel {
  final String name;

  OriginModel({required this.name});

  factory OriginModel.fromJson(Map<String, dynamic> json) =>
      _$OriginModelFromJson(json);

  Map<String, dynamic> toJson() => _$OriginModelToJson(this);
}

@JsonSerializable()
class LocationModel {
  final String name;

  LocationModel({required this.name});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
