import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/routing/route_generator.dart';

import 'core/app_colors.dart';
import 'core/app_router.dart';
import 'core/services/services_locator.dart';
import 'features/home/presentation/cubit/animation_cubit.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/pokemon/presentation/bloc/pokemon_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  log("Injection done");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // I have made routing without a routing libary since it is a simple app

  String getInitialPage() => AppRoutes.splash;
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(),
        ),
        BlocProvider<AnimationCubit>(
          create: (_) => AnimationCubit(),
        ),
        BlocProvider<PokemonBloc>(create: (_) {
          return sl<PokemonBloc>()..add(const FetchPokemonPageEvent(page: 0));
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Pokemon',
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
        ),
        initialRoute: getInitialPage(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
