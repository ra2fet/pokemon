part of 'animation_cubit.dart';

class AnimationState extends Equatable {
  final Color itemColor;
  final ShapeBorder shape;

  const AnimationState({
    this.itemColor = secondaryColor,
    this.shape = const RoundedRectangleBorder(),
  });

  AnimationState copyWith({
    Color? itemColor,
    ShapeBorder? shape,
  }) {
    return AnimationState(
      itemColor: itemColor ?? this.itemColor,
      shape: shape ?? this.shape,
    );
  }

  @override
  List<Object> get props => [itemColor, shape];
}
