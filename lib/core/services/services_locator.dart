import 'package:get_it/get_it.dart';
import 'package:pokemon/features/pokemon/data/repository/pokemon_repository.dart';
import 'package:pokemon/features/pokemon/domain/repository/base_pokemon_repository.dart';
import 'package:pokemon/features/pokemon/domain/usecases/get_pokemon_usecase.dart';

import '../../features/pokemon/data/datasources/pokemon_remote_data_source.dart';
import '../../features/pokemon/presentation/bloc/pokemon_bloc.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // Bloc
  sl.registerFactory(() => PokemonBloc(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetPokemonsUseCase(sl()));

  //  Repository
  sl.registerLazySingleton<BasePokemonRepository>(
      () => PokemonRepository(sl()));

  //Data Source
  sl.registerLazySingleton<BasePokemonDataSource>(
      () => PokemonDataRemoteSource());
}
