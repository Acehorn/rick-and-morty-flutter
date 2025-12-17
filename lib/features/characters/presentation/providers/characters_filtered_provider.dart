import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickmortyproject/features/characters/presentation/providers/characters_list_provider.dart';
import 'package:rickmortyproject/features/characters/presentation/providers/characters_filter_provider.dart';
import '../../../favorites/providers/favorites_provider.dart';

final filteredCharactersProvider = Provider((ref) {
  final listState = ref.watch(charactersListProvider);
  final favorites = ref.watch(favoritesProvider);
  final showFavoritesOnly = ref.watch(showFavoritesOnlyProvider);

  if (!showFavoritesOnly) {
    return listState.characters;
  }

  return listState.characters
      .where((c) => favorites.isFavorite(c.id))
      .toList();
});
