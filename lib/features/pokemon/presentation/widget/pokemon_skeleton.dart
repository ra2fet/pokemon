import 'package:flutter/material.dart';
import 'package:pokemon/core/shared/widgets/shimmer.dart';

import '../../../../core/utils/app_constants.dart';

class PokemonSkeleton extends StatelessWidget {
  const PokemonSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => shimmer(Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 10, horizontal: AppConstants.horizontalPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 100,
                    child: ShimmerWidget1(
                      height: 100,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: ShimmerWidget1(
                        height: 10,
                        width: 100,
                      ),
                    ),
                  ))
                ],
              ),
            )));
  }
}
