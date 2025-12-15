import 'package:dio/dio.dart';
import 'package:rickmortyproject/core/constants/api_constants.dart';
import 'package:rickmortyproject/features/characters/data/models/character_response.dart';


abstract class CharactersRemoteDatasource {
  Future<CharacterResponse> getCharacters({
    int page = 1,
    String? name,
  });
}

class CharactersRemoteDatasourceImpl
    implements CharactersRemoteDatasource {
  final Dio dio;

  CharactersRemoteDatasourceImpl(this.dio);

  @override
  Future<CharacterResponse> getCharacters({
    int page = 1,
    String? name,
  }) async {
    final response = await dio.get(
      ApiConstants.characters,
      queryParameters: {
        'page': page,
        if (name != null && name.isNotEmpty) 'name': name,
      },
    );

    return CharacterResponse.fromJson(response.data);
  }
}
