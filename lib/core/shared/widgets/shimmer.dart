import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmer(Widget t) => Shimmer.fromColors(
      baseColor: Colors.black.withOpacity(0.2),
      highlightColor: Colors.white,
      child: t,
    );

class ShimmerWidget1 extends StatelessWidget {
  const ShimmerWidget1({Key? key, this.height, this.width = double.infinity})
      : super(key: key);
  final double? height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 200,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

class ShimmerWidget2 extends StatelessWidget {
  const ShimmerWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 150,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12),
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
          );
        }, childCount: 4));
  }
}
