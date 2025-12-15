import 'package:flutter/material.dart';

class CharactersSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CharactersSearchBar({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search character...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
