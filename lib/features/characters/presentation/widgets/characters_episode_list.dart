import 'package:flutter/material.dart';

class CharacterEpisodesList extends StatelessWidget {
  final List<String> episodes;

  const CharacterEpisodesList({
    super.key,
    required this.episodes,
  });

  String _mapEpisode(String url) {
    final id = url.split('/').last;
    return 'Episode $id';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Episodes',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        ...episodes.map(
          (e) => Text(
            _mapEpisode(e),
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
