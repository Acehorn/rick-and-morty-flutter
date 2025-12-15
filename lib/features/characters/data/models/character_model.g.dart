// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(
  Map<String, dynamic> json,
) => CharacterModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  species: json['species'] as String,
  image: json['image'] as String,
  origin: OriginModel.fromJson(json['origin'] as Map<String, dynamic>),
  location: LocationModel.fromJson(json['location'] as Map<String, dynamic>),
  episodes: (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'species': instance.species,
      'image': instance.image,
      'origin': instance.origin,
      'location': instance.location,
      'episode': instance.episodes,
    };

OriginModel _$OriginModelFromJson(Map<String, dynamic> json) =>
    OriginModel(name: json['name'] as String);

Map<String, dynamic> _$OriginModelToJson(OriginModel instance) =>
    <String, dynamic>{'name': instance.name};

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(name: json['name'] as String);

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{'name': instance.name};
