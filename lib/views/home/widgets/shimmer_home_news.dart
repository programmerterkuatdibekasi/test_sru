import 'package:flutter/material.dart';
import '../../../widgets/widgets.dart';

class ShimmerHomeNews extends StatelessWidget {
  const ShimmerHomeNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverList.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => SpaceHeight(10.0),
        itemBuilder: (context, index) {
          return SizedBox(
            height: 140.0,
            width: 140.0,
            child: Row(
              spacing: 10.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultShimmerBox(
                  height: 140.0,
                  width: 140.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 10.0,
                    children: [
                      DefaultShimmerBox(
                        height: 15.0,
                        width: double.infinity,
                        radius: 8.0,
                      ),
                      DefaultShimmerBox(
                        height: 15.0,
                        width: double.infinity,
                        radius: 8.0,
                      ),
                      DefaultShimmerBox(
                        height: 15.0,
                        width: double.infinity,
                        radius: 8.0,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }, 
      ),
    );
  }
}