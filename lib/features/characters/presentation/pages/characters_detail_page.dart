import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickmortyproject/features/characters/presentation/widgets/characters_episode_list.dart';
import 'package:rickmortyproject/features/favorites/presentation/providers/favorites_provider.dart';
import '../widgets/character_info_tile.dart';
import '../../domain/entities/character.dart';

class CharacterDetailPage extends ConsumerWidget {
  final Character character;

  const CharacterDetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesState = ref.watch(favoritesProvider);
    final isFavorite = favoritesState.isFavorite(character.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              ref
                  .read(favoritesProvider.notifier)
                  .toggleFavorite(character.id);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'character-${character.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  character.image,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 24),

            CharacterInfoTile(
              label: 'Species',
              value: character.species,
            ),
            CharacterInfoTile(
              label: 'Origin',
              value: character.origin,
            ),
            CharacterInfoTile(
              label: 'Last Location',
              value: character.location,
            ),

            const SizedBox(height: 24),

            CharacterEpisodesList(
              episodes: character.episodes,
            ),
          ],
        ),
      ),
    );
  }
}
