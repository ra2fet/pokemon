import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/utils/app_constants.dart';
import 'package:pokemon/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:pokemon/features/pokemon/presentation/widget/pokemon_skeleton.dart';

import '../../../../core/utils/enums.dart';
import '../widget/pokemon_card_item.dart';

class Pokemons extends StatelessWidget {
  int page = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Pokemon"),
        ),
        body: BlocConsumer<PokemonBloc, PokemonState>(
          listener: (context, state) {
            if (state.loadMore) {
              SnackBar snackBar = SnackBar(
                  content: Text(state.canLoadNextPage
                      ? "Loading more pokemons..."
                      : "Already loaded all the pokemons"));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          buildWhen: (previous, current) =>
              previous.getPokemons != current.getPokemons,
          builder: (BuildContext context, state) {
            switch (state.getPokemonsState) {
              case RequestState.loading:
                return const PokemonSkeleton();

              case RequestState.loaded:
                return Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20,
                          right: AppConstants.horizontalPadding,
                          left: AppConstants.horizontalPadding),
                      child: NotificationListener<ScrollEndNotification>(
                        onNotification: (scrollEnd) {
                          if (scrollEnd.metrics.atEdge &&
                              scrollEnd.metrics.pixels > 0) {
                            _loadMore(context);
                          }
                          return true;
                        },
                        child: ListView.separated(
                          itemCount: state.getPokemons.length,
                          itemBuilder: (context, index) {
                            return PokemonCardItem(
                              pokemon: state.getPokemons[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            height: 10,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                            color: Colors.black54,
                            child: Text(
                              textAlign: TextAlign.center,
                              'Total Pokemons are: ${state.getPokemons.length}',
                              style: const TextStyle(color: Colors.white),
                            ))),
                  ],
                );
              case RequestState.error:
                return Center(
                  child: Text(state.getPokemonsMessage),
                );
            }
          },
        ));
  }

  Future<bool> _loadMore(context) async {
    page++;
    debugPrint("page : $page");
    BlocProvider.of<PokemonBloc>(context).add(LoadMorePokemonEvent(page: page));
    return true;
  }
}
