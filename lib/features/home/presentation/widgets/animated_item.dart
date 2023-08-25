import 'package:flutter/material.dart';

import '../cubit/animation_cubit.dart';

class AnimatedItem extends StatelessWidget {
  final AnimationState state;

  const AnimatedItem({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeOut,
      width: 300,
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: ShapeDecoration(
        shape: state.shape,
        color: state.itemColor,
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}
