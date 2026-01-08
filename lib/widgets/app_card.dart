import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final double? height, width, elevation;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final double? radius;
  final bool isCircleBorder;
  final Decoration? decoration;
  const AppCard({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.elevation,
    this.onTap,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.radius,
    this.isCircleBorder = false,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: decoration != null ? null : backgroundColor ?? Colors.grey,
        shape: isCircleBorder ? const CircleBorder() : null,
        borderRadius: () {
          final decoration = this.decoration;
          if (decoration is BoxDecoration) {
            return decoration.borderRadius;
          }
          return isCircleBorder
            ? null
            : borderRadius ?? BorderRadius.circular(radius ?? 8.0);
        } (),
        elevation: elevation ?? 2.0,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.blueGrey,
          child: Container(
            decoration:
                decoration ??
                BoxDecoration(
                  borderRadius: isCircleBorder
                      ? null
                      : BorderRadius.circular(radius ?? 8.0),
                ),
            child: Padding(
              padding: padding ?? const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class AppCardShimmer extends StatelessWidget {
  const AppCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}