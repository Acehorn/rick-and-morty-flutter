import 'package:rickmortyproject/features/characters/data/models/character_model.dart';

import '../../domain/entities/character.dart';

extension CharacterModelMapper on CharacterModel {
  Character toEntity() {
    return Character(
      id: id,
      name: name,
      species: species,
      image: image,
      origin: origin.name,
      location: location.name,
      episodes: episodes,
    );
  }
}
