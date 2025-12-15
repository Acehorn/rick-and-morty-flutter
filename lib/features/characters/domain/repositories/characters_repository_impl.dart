import 'package:dio/dio.dart';
import 'package:rickmortyproject/features/characters/data/datasources/characters_remote_datasource.dart';
import 'package:rickmortyproject/features/characters/domain/entities/character_mapper.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../domain/entities/character.dart';
import '../../domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersRemoteDatasource remoteDatasource;

  CharactersRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<Character>> getCharacters({
    int page = 1,
    String? name,
  }) async {
    try {
      final response = await remoteDatasource.getCharacters(
        page: page,
        name: name,
      );

      return response.results.map((e) => e.toEntity()).toList();
    } on DioException catch (e) {
      throw ServerFailure(NetworkExceptions.getMessage(e));
    } catch (_) {
      throw const UnknownFailure('Unexpected error');
    }
  }
}
