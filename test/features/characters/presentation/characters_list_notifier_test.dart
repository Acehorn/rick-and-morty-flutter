import 'package:flutter_test/flutter_test.dart';
import 'package:rickmortyproject/features/characters/presentation/providers/characters_list_notifier.dart';
import 'fake_characters_repository.dart';

void main() {
  group('CharactersListNotifier', () {
    late CharactersListNotifier notifier;
    late FakeCharactersRepository repository;

    setUp(() {
      repository = FakeCharactersRepository();
      notifier = CharactersListNotifier(repository);
    });

    test('loadInitial loads first page of characters', () async {
      await notifier.loadInitial();

      expect(notifier.state.characters, isNotEmpty);
      expect(notifier.state.currentPage, 1);
      expect(notifier.state.isLoading, false);
    });

    test('loadNextPage appends characters', () async {
      await notifier.loadInitial();
      final firstCount = notifier.state.characters.length;

      await notifier.loadNextPage();

      expect(notifier.state.characters.length, greaterThan(firstCount));
    });

    test('search resets list and applies query', () async {
      await notifier.searchCharacters('Rick');

      expect(notifier.state.searchQuery, 'Rick');
      expect(
        notifier.state.characters.every((c) => c.name.contains('Rick')),
        true,
      );
    });
  });
}
