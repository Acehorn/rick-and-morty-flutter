import 'package:flutter_test/flutter_test.dart';
import 'package:rickmortyproject/features/characters/data/models/character_model.dart';
import 'package:rickmortyproject/features/characters/data/mappers/character_mapper.dart';

void main() {
  test('CharacterModel should map correctly to Character entity', () {
    final model = CharacterModel(
      id: 1,
      name: 'Rick Sanchez',
      species: 'Human',
      image: 'https://image.com/rick.png',
      origin: OriginModel(name: 'Earth'),
      location: LocationModel(name: 'Citadel'),
      episodes: ['ep1', 'ep2'],
    );

    final entity = model.toEntity();

    expect(entity.id, 1);
    expect(entity.name, 'Rick Sanchez');
    expect(entity.origin, 'Earth');
    expect(entity.location, 'Citadel');
    expect(entity.episodes.length, 2);
  });
}
