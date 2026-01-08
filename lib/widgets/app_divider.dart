import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final Axis direction;
  final Color? color;
  final double thickness;
  final double? length;
  final BorderRadius borderRadius;

  const AppDivider({
    super.key,
    this.direction = Axis.horizontal,
    this.color,
    this.thickness = 1.5,
    this.length,
    this.borderRadius = const BorderRadius.all(Radius.zero),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: direction == Axis.vertical ? thickness : length,
      height: direction == Axis.horizontal ? thickness : length,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).dividerColor,
        borderRadius: borderRadius,
      ),
    );
  }
}