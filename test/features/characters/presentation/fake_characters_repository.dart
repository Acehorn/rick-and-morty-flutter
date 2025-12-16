import 'package:rickmortyproject/features/characters/domain/entities/character.dart';
import 'package:rickmortyproject/features/characters/domain/repositories/characters_repository.dart';

class FakeCharactersRepository implements CharactersRepository {
  @override
  Future<List<Character>> getCharacters({
    int page = 1,
    String? name,
  }) async {
    final allCharacters = List.generate(
      5,
      (index) => Character(
        id: page * 10 + index,
        name: name != null ? '$name $index' : 'Character $index',
        species: 'Human',
        image: 'https://image.com',
        origin: 'Earth',
        location: 'Citadel',
        episodes: const ['1', '2'],
      ),
    );

    return allCharacters;
  }
}
