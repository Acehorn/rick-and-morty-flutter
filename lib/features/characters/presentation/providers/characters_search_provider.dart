import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickmortyproject/features/characters/domain/entities/character.dart';
import 'package:rickmortyproject/features/characters/domain/repositories/characters_repository.dart';
import 'package:rickmortyproject/features/providers/characters_repository_provider.dart';

final characterSearchProvider =
    StateNotifierProvider<CharacterSearchNotifier, AsyncValue<List<Character>>>(
  (ref) {
    final repository = ref.watch(charactersRepositoryProvider);
    return CharacterSearchNotifier(repository);
  },
);

class CharacterSearchNotifier
    extends StateNotifier<AsyncValue<List<Character>>> {
  final CharactersRepository repository;

  CharacterSearchNotifier(this.repository)
      : super(const AsyncValue.data([]));

  Future<void> search(String query) async {
    if (query.isEmpty) {
      state = const AsyncValue.data([]);
      return;
    }

    state = const AsyncValue.loading();

    try {
      final result =
          await repository.getCharacters(page: 1, name: query);
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
