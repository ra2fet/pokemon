import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/features/home/presentation/cubit/animation_cubit.dart';

import '../widgets/animated_item.dart';
import '../widgets/shape_toolbar.dart';

class AnimationsArguments {
  final String name;

  AnimationsArguments({required this.name});
}

class Animations extends StatelessWidget {
  final String name;

  const Animations({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Animations")),
        body: BlocBuilder<AnimationCubit, AnimationState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(name),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: AnimatedItem(
                      state: state,
                    )),
                const Spacer(flex: 1),
                const ShapesToolBar(),
                const SizedBox(
                  height: 40,
                ),
              ],
            );
          },
        ));
  }
}
