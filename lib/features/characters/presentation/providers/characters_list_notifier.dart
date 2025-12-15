import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/characters_repository.dart';
import 'characters_list_state.dart';

class CharactersListNotifier
    extends StateNotifier<CharactersListState> {
  final CharactersRepository repository;

  CharactersListNotifier(this.repository)
      : super(const CharactersListState()) {
    loadInitial();
  }

  Future<void> loadInitial() async {
    state = state.copyWith(
      isLoading: true,
      currentPage: 1,
      hasNextPage: true,
      characters: [],
      error: null,
    );

    await _fetchPage(page: 1);
  }

  Future<void> loadNextPage() async {
    if (state.isLoading || !state.hasNextPage) return;

    await _fetchPage(page: state.currentPage + 1);
  }

  Future<void> searchCharacters(String query) async {
    state = state.copyWith(
      searchQuery: query,
    );

    await loadInitial();
  }

  Future<void> _fetchPage({required int page}) async {
    try {
      state = state.copyWith(isLoading: true);

      final result = await repository.getCharacters(
        page: page,
        name: state.searchQuery.isEmpty
            ? null
            : state.searchQuery,
      );

      state = state.copyWith(
        characters: [...state.characters, ...result],
        currentPage: page,
        hasNextPage: result.isNotEmpty,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
