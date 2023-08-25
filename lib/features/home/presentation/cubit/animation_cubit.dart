import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

part 'animation_state.dart';

class AnimationCubit extends Cubit<AnimationState> {
  AnimationCubit() : super(const AnimationState());

  // Methods to change the properties
  void changeColor(Color newColor) {
    emit(state.copyWith(itemColor: newColor));
  }

  void changeShape(ShapeBorder newShape) {
    emit(state.copyWith(shape: newShape));
  }

  void changeShapeAndColor(
      {required ShapeBorder shape, required Color newColor}) {
    emit(state.copyWith(shape: shape, itemColor: newColor));
  }
}
