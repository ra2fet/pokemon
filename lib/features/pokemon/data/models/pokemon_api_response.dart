import 'package:pokemon/features/pokemon/data/models/pokemon_model.dart';

import '../../domain/entities/pokemon.dart';

class PokemonApiResponse {
  final List<Pokemon> pokemonList;
  final bool canLoadNextPage;

  PokemonApiResponse(
      {required this.pokemonList, required this.canLoadNextPage});

  factory PokemonApiResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNextPage = json['next'] != null;
    final pokemonList =
        (json['results'] as List).map((e) => PokemonModel.fromJson(e)).toList();

    return PokemonApiResponse(
        canLoadNextPage: canLoadNextPage, pokemonList: pokemonList);
  }
}
