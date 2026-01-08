import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:test_sru/gen/assets.gen.dart';


class ImageCachedNetworkImage extends ExtendedImage {
  final BoxFit boxFit;

  @override
  LoadStateChanged? get loadStateChanged => (state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.imagePlaceholder.path),
              fit: boxFit
            )
          ),
        );
      case LoadState.completed:
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: state.imageProvider,
              fit: boxFit,
            ),
          ),
        );
      case LoadState.failed:
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.noImage.path),
              fit: boxFit
            )
          ),
        );
    }
  };

  ImageCachedNetworkImage({
    super.key,
    required String imageUrl,
    this.boxFit = BoxFit.cover
  }) : super.network(
    imageUrl,
    cacheHeight: 500,
    enableLoadState: false,
    clearMemoryCacheWhenDispose: false,
  );
}