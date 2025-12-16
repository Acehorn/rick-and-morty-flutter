import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'favorites_state.dart';

class FavoritesNotifier extends StateNotifier<FavoritesState> {
  final Box<int> box;

  FavoritesNotifier(this.box)
      : super(
          FavoritesState(
            favorites: box.values.toSet(),
          ),
        );

  void toggleFavorite(int characterId) {
    if (state.favorites.contains(characterId)) {
      box.delete(characterId);
      state = state.copyWith(
        favorites: {...state.favorites}..remove(characterId),
      );
    } else {
      box.put(characterId, characterId);
      state = state.copyWith(
        favorites: {...state.favorites}..add(characterId),
      );
    }
  }
}
