import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickmortyproject/features/characters/domain/repositories/characters_repository.dart';
import 'package:rickmortyproject/features/characters/data/repositories/characters_repository_impl.dart';
import 'package:rickmortyproject/features/providers/characters_datasource_provider.dart';

final charactersRepositoryProvider =
    Provider<CharactersRepository>((ref) {
  final remoteDatasource =
      ref.watch(charactersRemoteDatasourceProvider);

  return CharactersRepositoryImpl(remoteDatasource);
});
