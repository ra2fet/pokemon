import 'package:equatable/equatable.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_api_response.dart';
import 'package:pokemon/features/pokemon/domain/repository/base_pokemon_repository.dart';

import '../../../../core/usecase/base_usecase.dart';

class GetPokemonsUseCase
    extends BaseUseCase<PokemonApiResponse, GetPokemonsParameters> {
  final BasePokemonRepository basePokemonRepository;

  GetPokemonsUseCase(this.basePokemonRepository);
  @override
  Future<Either<Failure, PokemonApiResponse>> call(
      GetPokemonsParameters parameters) async {
    return await basePokemonRepository.getPokemons(parameters.page);
  }
}

class GetPokemonsParameters extends Equatable {
  final int page;
  const GetPokemonsParameters({required this.page});

  @override
  List<Object?> get props => [page];
}
