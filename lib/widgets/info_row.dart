import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? titleWidget;
  final Widget? subtitleWidget;
  final double spacing;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  const InfoRow({
    super.key,
    this.title,
    this.subtitle,
    this.titleWidget,
    this.subtitleWidget,
    this.spacing = 0.0,
    this.titleStyle,
    this.subtitleStyle,
  }) : assert(
        title != null || titleWidget != null,
        'Either provide a title or titleWidget',
      ),
      assert(
        subtitle != null || subtitleWidget != null,
        'Either provide a subtitle or subtitleWidget',
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: spacing,
      children: [
        Expanded(
          child: titleWidget ?? Text(
            title ?? "",
            style: titleStyle,
          ),
        ),
        subtitleWidget ?? Text(
          subtitle ?? "",
          style: subtitleStyle,
        ),
      ],
    );
  }
}
