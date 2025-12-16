class FavoritesState {
  final Set<int> favorites;

  const FavoritesState({required this.favorites});

  bool isFavorite(int id) => favorites.contains(id);

  FavoritesState copyWith({Set<int>? favorites}) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
    );
  }
}
