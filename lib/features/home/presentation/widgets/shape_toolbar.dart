import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_colors.dart';
import '../cubit/animation_cubit.dart';

class ShapesToolBar extends StatelessWidget {
  const ShapesToolBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            BlocProvider.of<AnimationCubit>(context).changeShapeAndColor(
                newColor: Colors.blue.shade900,
                shape: const RoundedRectangleBorder());
          },
          child: Container(
            height: 50,
            width: 50,
            color: Colors.blue.shade900,
          ),
        ),
        InkWell(
          onTap: () {
            BlocProvider.of<AnimationCubit>(context).changeShapeAndColor(
                newColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)));
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(15)),
          ),
        ),
        InkWell(
          onTap: () {
            BlocProvider.of<AnimationCubit>(context).changeShapeAndColor(
                newColor: red, shape: const CircleBorder());
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(color: red, shape: BoxShape.circle),
          ),
        ),
      ],
    );
  }
}
