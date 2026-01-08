import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'widgets.dart';

// ignore: must_be_immutable
class AppShimmer extends StatelessWidget {
  final Widget child;
  final Duration period;
  final ShimmerDirection direction;
  Gradient? _gradient;
  final int loop;
  final bool enabled;
  Color? _baseColor;
  Color? _highlightColor;

  AppShimmer({
    super.key,
    required this.child,
    required Gradient gradient,
    this.direction = ShimmerDirection.ltr,
    this.period = const Duration(milliseconds: 1500),
    this.loop = 0,
    this.enabled = true,
  }) : _gradient = gradient;

  AppShimmer.fromColors({
    super.key,
    required this.child,
    Color? baseColor,
    Color? highlightColor,
    this.period = const Duration(milliseconds: 1500),
    this.direction = ShimmerDirection.ltr,
    this.loop = 0,
    this.enabled = true,
  }) : _baseColor = baseColor ?? const Color(0xFFfafafa),
      _highlightColor = highlightColor ?? const Color(0xFFEEEEEE);

  @override
  Widget build(BuildContext context) {
    _gradient ??= LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        _baseColor!,
        _baseColor!,
        _highlightColor!,
        _baseColor!,
        _baseColor!
      ],
      stops: const <double>[
        0.0,
        0.35,
        0.5,
        0.65,
        1.0
      ]
    );
    return ShimmerCustomEffectMarker(
      child: Shimmer(
        key: key,
        gradient: _gradient!,
        direction: direction,
        period: period,
        loop: loop,
        enabled: enabled,
        child: child,
      )
    );
  }
}

class ShimmerCustomEffectMarker extends InheritedWidget {
  const ShimmerCustomEffectMarker({
    super.key,
    required super.child
  });

  static ShimmerCustomEffectMarker? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShimmerCustomEffectMarker>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class DefaultShimmerBox extends StatelessWidget {
  final double radius;
  final double height;
  final double width;
  final bool isCircleBorder;

  const DefaultShimmerBox({
    super.key,
    this.radius = 0.0,
    this.height = 120.0,
    this.width = double.infinity,
    this.isCircleBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppShimmer.fromColors(
      child: AppCard(
        radius: radius,
        height: height,
        width: width,
        elevation: 0.0,
        isCircleBorder: isCircleBorder,
        child: const SizedBox.shrink(),
      ),
    );
  }
}
