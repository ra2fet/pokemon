part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class FetchPokemonPageEvent extends PokemonEvent {
  final int page;

  const FetchPokemonPageEvent({required this.page});
}

class LoadMorePokemonEvent extends PokemonEvent {
  int page;

  LoadMorePokemonEvent({required this.page});
}
