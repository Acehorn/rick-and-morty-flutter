import 'package:flutter/material.dart';
import '../../domain/entities/character.dart';

class CharacterListItem extends StatelessWidget {
  final Character character;

  const CharacterListItem({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: 'character-${character.id}',
        child: CircleAvatar(
          backgroundImage: NetworkImage(character.image),
        ),
      ),
      title: Text(character.name),
      subtitle: Text(character.species),
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: character,
        );
      },
    );
  }
}
