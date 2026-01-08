import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sru/gen/assets.gen.dart';
import 'package:test_sru/models/news/news_model.dart';
import 'package:test_sru/services/news_local_service.dart';
import 'package:test_sru/utils/app_style.dart';
import 'package:test_sru/utils/injector.dart';
import 'package:test_sru/utils/string_utils.dart';
import 'package:test_sru/widgets/widgets.dart';
import '../../controllers/news_detail_controller.dart';
import '../../utils/main_route_observer.dart';

class NewsDetailView extends StatefulWidget {
  final NewsModel news;
  const NewsDetailView({super.key, required this.news});

  @override
  State<NewsDetailView> createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetailView> {
  final controller = Get.put(
    NewsDetailController(newsLocalService: locator<NewsLocalService>()),
  );

  @override
  void initState() {
    super.initState();
    _setDelegate();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.checkIsSavedOnBookmark();
    });
  }

  void _setDelegate() {
    controller.setDelegate(
      NewsDetailDelegate(
        onGetNews: () => widget.news,
        onToggleBookMark: (news) => locator<MainRouteObserver>().onToggleBookMark?.call(news),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Obx(
            () {
              final bool isSaved = controller.isSaved.value;
              return IconButton(
                onPressed: () async => await controller.toggleBookmark(widget.news),
                icon: isSaved ? Assets.images.bookmarkSelected.image() : Assets.images.bookmarkUnselected.image(),
              );
            },
          ),
          SpaceWidth(10.0),
        ],
      ),
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 230.0,
              width: double.infinity,
              child: ImageCachedNetworkImage(imageUrl: widget.news.urlImage),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16.0,
                children: [
                  AppText(
                    text: widget.news.description,
                    textStyle: AppTextStyle.h2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppText(
                          text: "by ${widget.news.author}",
                          textStyle: AppTextStyle.regularStyle.copyWith(
                            color: AppColorStyle.grey,
                          ),
                        ),
                      ),
                      AppText(
                        text: StringUtils.timeAgo(widget.news.publishedAt),
                        textStyle: AppTextStyle.regularStyle.copyWith(
                          color: AppColorStyle.grey,
                        ),
                      ),
                    ],
                  ),
                  AppText(
                    text: widget.news.content,
                    textStyle: AppTextStyle.regularStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
