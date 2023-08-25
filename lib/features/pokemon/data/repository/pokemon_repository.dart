import 'package:pokemon/features/pokemon/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokemon/features/pokemon/data/models/pokemon_api_response.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon/features/pokemon/domain/repository/base_pokemon_repository.dart';

import '../../../../core/error/exception.dart';

class PokemonRepository extends BasePokemonRepository {
  final BasePokemonDataSource basePokemonDataSource;

  PokemonRepository(this.basePokemonDataSource);

  @override
  Future<Either<Failure, PokemonApiResponse>> getPokemons(int page) async {
    final result = await basePokemonDataSource.getPokemons(page);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
