import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon/features/pokemon/domain/usecases/get_pokemon_usecase.dart';

import '../../../../core/utils/enums.dart';
import '../../domain/entities/pokemon.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemonsUseCase getPokemonsUseCase;

  PokemonBloc(this.getPokemonsUseCase) : super(const PokemonState()) {
    on<FetchPokemonPageEvent>(_getPokemons);
    on<LoadMorePokemonEvent>(_getMorePokemons);
  }
  Future<FutureOr<void>> _getPokemons(
      FetchPokemonPageEvent event, Emitter<PokemonState> emit) async {
    final result =
        await getPokemonsUseCase(GetPokemonsParameters(page: event.page));

    result.fold(
        (l) => emit(state.copyWith(
            getPokemonsMessage: l.message,
            getPokemonsState: RequestState.error)),
        (r) => emit(state.copyWith(
            getPokemons: r.pokemonList,
            canLoadNextPage: r.canLoadNextPage,
            getPokemonsState: RequestState.loaded)));
  }

  Future<FutureOr<void>> _getMorePokemons(
      LoadMorePokemonEvent event, Emitter<PokemonState> emit) async {
    final result =
        await getPokemonsUseCase(GetPokemonsParameters(page: event.page));
    log('loadmore: ${state.loadMore}');

    emit(state.copyWith(loadMore: true));
    log('loadmore: ${state.loadMore}');

    result.fold(
        (l) => emit(state.copyWith(
            getPokemonsMessage: l.message,
            getPokemonsState: RequestState.error)), (r) {
      if (r.canLoadNextPage) {
        log("load more ...");
        emit(state.copyWith(
            getPokemons: [...state.getPokemons, ...r.pokemonList],
            canLoadNextPage: r.canLoadNextPage,
            loadMore: false,
            getPokemonsState: RequestState.loaded));
      } else {
        log("can't load more ...");

        emit(state.copyWith(
            getPokemons: state.getPokemons,
            canLoadNextPage: r.canLoadNextPage,
            loadMore: false,
            getPokemonsState: RequestState.loaded));
      }
    });
  }
}
