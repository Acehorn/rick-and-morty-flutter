import 'package:flutter/material.dart';
import 'package:rickmortyproject/features/characters/presentation/providers/characters_list_state.dart';
import 'package:rickmortyproject/features/characters/presentation/widgets/characters_list_item.dart';

class CharacterList extends StatefulWidget {
  final CharactersListState state;
    final VoidCallback onLoadMore;

  const CharacterList({
    super.key,
    required this.state,
    required this.onLoadMore,
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
  if (_scrollController.position.pixels >=
      _scrollController.position.maxScrollExtent - 200) {
    if (!widget.state.isLoading && widget.state.hasNextPage) {
      widget.onLoadMore();
    }
  }
}



  @override
  Widget build(BuildContext context) {
    if (widget.state.isLoading && widget.state.characters.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (widget.state.error != null) {
      return Center(child: Text(widget.state.error!));
    }

    return ListView.builder(
      controller: _scrollController,
    itemCount: widget.state.characters.length +
    (widget.state.isLoading ? 1 : 0),
itemBuilder: (context, index) {
  if (index >= widget.state.characters.length) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  final character = widget.state.characters[index];
  return CharacterListItem(character: character);
},
    );
  }
}
