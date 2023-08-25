part of 'pokemon_bloc.dart';

class PokemonState extends Equatable {
  final List<Pokemon> getPokemons;
  final bool canLoadNextPage;
  final bool loadMore;
  final RequestState getPokemonsState;
  final String getPokemonsMessage;

  const PokemonState({
    this.getPokemons = const [],
    this.canLoadNextPage = false,
    this.loadMore = false,
    this.getPokemonsState = RequestState.loading,
    this.getPokemonsMessage = '',
  });

  PokemonState copyWith({
    List<Pokemon>? getPokemons,
    bool? canLoadNextPage,
    bool? loadMore,
    RequestState? getPokemonsState,
    String? getPokemonsMessage,
  }) {
    return PokemonState(
      getPokemons: getPokemons ?? this.getPokemons,
      canLoadNextPage: canLoadNextPage ?? this.canLoadNextPage,
      loadMore: loadMore ?? this.loadMore,
      getPokemonsState: getPokemonsState ?? this.getPokemonsState,
      getPokemonsMessage: getPokemonsMessage ?? this.getPokemonsMessage,
    );
  }

  @override
  List<Object?> get props => [
        getPokemons,
        canLoadNextPage,
        loadMore,
        getPokemonsState,
        getPokemonsMessage,
      ];
}
