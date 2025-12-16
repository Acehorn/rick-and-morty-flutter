import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/characters_list_provider.dart';
import '../providers/characters_filter_provider.dart';
import '../providers/characters_filtered_provider.dart';
import '../widgets/characters_list.dart';
import '../widgets/characters_search_bar.dart';

class CharactersPage extends ConsumerWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(charactersListProvider);
    final characters = ref.watch(filteredCharactersProvider);
    final showFavoritesOnly = ref.watch(showFavoritesOnlyProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick & Morty'),
        actions: [
          IconButton(
            icon: Icon(
              showFavoritesOnly ? Icons.favorite : Icons.favorite_border,
              color: showFavoritesOnly ? Colors.red : null,
            ),
            onPressed: () {
              ref
                  .read(showFavoritesOnlyProvider.notifier)
                  .state = !showFavoritesOnly;
            },
          ),
        ],
      ),
      body: Column(
        children: [
          CharactersSearchBar(
            onChanged: (query) {
              ref
                  .read(charactersListProvider.notifier)
                  .searchCharacters(query);
            },
          ),
          Expanded(
            child: CharacterList(
              characters: characters,
              isLoading: state.isLoading,
              error: state.error,
              onLoadMore: showFavoritesOnly
                  ? null
                  : () {
                      ref
                          .read(charactersListProvider.notifier)
                          .loadNextPage();
                    },
            ),
          ),
        ],
      ),
    );
  }
}
