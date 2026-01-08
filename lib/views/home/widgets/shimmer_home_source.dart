import 'package:flutter/material.dart';
import '../../../widgets/widgets.dart';

class ShimmerHomeSource extends StatelessWidget {
  const ShimmerHomeSource({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => SpaceWidth(10.0),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, index) {
          return DefaultShimmerBox(
            height: 30.0,
            radius: 50.0,
            width: 100.0,
          );
        }, 
      ),
    );
  }
}