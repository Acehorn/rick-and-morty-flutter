import '../../domain/entities/character.dart';

class CharactersListState {
  final List<Character> characters;
  final bool isLoading;
  final String? error;
  final int currentPage;
  final bool hasNextPage;
  final void Function()? loadNextPage;
  final String searchQuery; 

  const CharactersListState({
    this.characters = const [],
    this.isLoading = false,
    this.error,
    this.currentPage = 1,
    this.hasNextPage = true,
    this.loadNextPage,
     this.searchQuery = '', 
  });

  CharactersListState copyWith({
    List<Character>? characters,
    bool? isLoading,
    String? error,
    int? currentPage,
    bool? hasNextPage,
    String? searchQuery, 
    void Function()? loadNextPage,
  }) {
    return CharactersListState(
      characters: characters ?? this.characters,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      currentPage: currentPage ?? this.currentPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    searchQuery: searchQuery ?? this.searchQuery,
      loadNextPage: loadNextPage ?? this.loadNextPage,
    );
  }
}
