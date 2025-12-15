import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickmortyproject/features/characters/presentation/widgets/characters_list.dart';
import 'package:rickmortyproject/features/characters/presentation/widgets/characters_search_bar.dart';
import '../providers/characters_list_provider.dart';


class CharactersPage extends ConsumerWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(charactersListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick & Morty'),
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
            child: CharacterList(state: state,
             onLoadMore: () {
           ref.read(charactersListProvider.notifier).loadNextPage();
  },
            ),
          ),
        ],
      ),
    );
  }
}
