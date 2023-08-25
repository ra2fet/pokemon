import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_api_response.dart';

import '../../../../core/utils/app_constants.dart';

abstract class BasePokemonDataSource {
  Future<PokemonApiResponse> getPokemons(int pageNumber);
}

class PokemonDataRemoteSource implements BasePokemonDataSource {
  @override
  Future<PokemonApiResponse> getPokemons(int pageNumber) async {
    final queryParameter = {'limit': '50', 'offset': "${pageNumber * 50}"};

    log("page : $pageNumber");

    // Load the JSON url
    final response = await Dio()
        .get(AppConstants.getPokemons, queryParameters: queryParameter);

    return PokemonApiResponse.fromJson(response.data);
  }
}
