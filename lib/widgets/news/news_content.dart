import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sru/models/news/news_model.dart';
import '../../utils/app_style.dart';
import '../../utils/string_utils.dart';
import '../../views/news/news_detail_view.dart';
import '../widgets.dart';

class NewsContent extends StatelessWidget {
  final NewsModel news;
  const NewsContent({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Get.to(NewsDetailView(news: news)),
      child: SizedBox(
        height: 140.0,
        width: 140.0,
        child: Row(
          spacing: 10.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 140.0,
              width: 140.0,
              child: ImageCachedNetworkImage(
                imageUrl: news.urlImage,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 10.0,
                children: [
                  AppText(
                    text: news.title,
                    maxLines: 3,
                    textOverflow: TextOverflow.ellipsis,
                    textStyle: AppTextStyle.h4.copyWith(color: AppColorStyle.black, fontWeight: AppTextStyle.bold),
                  ),
                  AppText(
                    text: "by ${news.author}",
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    textStyle: AppTextStyle.h4.copyWith(color: AppColorStyle.grey, fontSize: 13.0),
                  ),
                  AppText(
                    text: StringUtils.timeAgo(news.publishedAt?.toLocal()),
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    textStyle: AppTextStyle.h4.copyWith(color: AppColorStyle.grey, fontSize: 13.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}