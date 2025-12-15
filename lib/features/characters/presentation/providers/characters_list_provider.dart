import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickmortyproject/features/providers/characters_repository_provider.dart';
import 'characters_list_notifier.dart';
import 'characters_list_state.dart';

final charactersListProvider =
    StateNotifierProvider<CharactersListNotifier, CharactersListState>(
  (ref) {
    final repository = ref.watch(charactersRepositoryProvider);
    return CharactersListNotifier(repository);
  },
);

