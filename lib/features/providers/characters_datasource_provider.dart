import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickmortyproject/core/dio/dio_provider.dart';
import 'package:rickmortyproject/features/characters/data/datasources/characters_remote_datasource.dart';

final charactersRemoteDatasourceProvider =
    Provider<CharactersRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return CharactersRemoteDatasourceImpl(dio);
});
 