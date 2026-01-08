import 'package:flutter/material.dart';
import '../gen/assets.gen.dart';
import '../models/result.dart';
import '../utils/app_style.dart';
import 'widgets.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.images.noData.image(
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ],
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final String message;
  final Color? iconColor, textColor;
  const ErrorWidget({
    super.key,
    required this.message,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning, size: 35.0, color: iconColor ?? Colors.red),
          const SpaceHeight(10.0),
          AppText(
            text: message,
            align: TextAlign.center,
            textStyle: AppTextStyle.regularStyle.copyWith(
              color: textColor ?? AppColorStyle.black,
            ),
          ),
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColorStyle.black),
    );
  }
}

class ResultHandler<T> extends StatelessWidget {
  final Result<T> requestState;
  final Widget loadingWidget;
  final Widget Function(T? result) successWidget;
  final Widget Function(String message)? errorWidget;
  final Widget? emptyWidget;
  final Widget initialWidget;
  final Color? iconColor, textColor;
  final bool isSliver;

  const ResultHandler({
    super.key,
    required this.requestState,
    required this.successWidget,
    this.loadingWidget = const LoadingWidget(),
    this.errorWidget,
    this.emptyWidget,
    this.initialWidget = const SizedBox(),
    this.iconColor,
    this.textColor,
    this.isSliver = false,
  });

  @override
  Widget build(BuildContext context) {
    return () {
      if(isSliver) {
        Widget widgetToSliver(Widget widget) {
          if (widget is SliverMarker) {
            return widget.sliver;
          }
          return SliverToBoxAdapter(
            child: widget
          );
        }
        return widgetToSliver(_getChild());
      }
      return _getChild();
    } ();
  }

  Widget _getChild() {
    switch (requestState) {
      case Failed _:
        if (errorWidget != null) {
          return errorWidget!(requestState.errorMessage ?? "");
        } else {
          return ErrorWidget(
            message: requestState.errorMessage ?? "",
            iconColor: iconColor,
            textColor: textColor,
          );
        }
      case Initial _:
        return initialWidget;
      case Empty _:
        return emptyWidget ?? EmptyWidget();
      case Loading _:
        return loadingWidget;
      case Success _:
        return successWidget(requestState.resultValue);
    }
  }
}