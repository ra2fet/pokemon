import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/pokemon_api_response.dart';

abstract class BasePokemonRepository {
  Future<Either<Failure, PokemonApiResponse>> getPokemons(int page);
}
