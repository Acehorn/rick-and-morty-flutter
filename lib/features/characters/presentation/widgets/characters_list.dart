import 'package:flutter/material.dart';
import 'package:rickmortyproject/features/characters/domain/entities/character.dart';
import 'package:rickmortyproject/features/characters/presentation/widgets/characters_list_item.dart';

class CharacterList extends StatefulWidget {
 final List<Character> characters;
  final bool isLoading;
  final String? error;
  final VoidCallback? onLoadMore;

  const CharacterList({
    super.key,
    required this.characters,
    required this.isLoading,
    this.error,
    this.onLoadMore,
  });

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

void _onScroll() {
  if (widget.onLoadMore == null) return;

  if (_scrollController.position.pixels >=
      _scrollController.position.maxScrollExtent - 200) {
    widget.onLoadMore!.call();
  }
}



@override
Widget build(BuildContext context) {
  if (widget.isLoading && widget.characters.isEmpty) {
    return const Center(child: CircularProgressIndicator());
  }

  if (widget.error != null) {
    return Center(child: Text(widget.error!));
  }

  if (widget.characters.isEmpty) {
    return const Center(
      child: Text('No characters found'),
    );
  }

  return ListView.builder(
    controller: _scrollController,
    itemCount: widget.characters.length +
        (widget.isLoading && widget.onLoadMore != null ? 1 : 0),
    itemBuilder: (context, index) {
      if (index >= widget.characters.length) {
        return const Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: CircularProgressIndicator()),
        );
      }

      final character = widget.characters[index];
      return CharacterListItem(character: character);
    },
  );
}

}
