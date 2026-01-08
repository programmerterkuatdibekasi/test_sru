import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sru/utils/main_route_observer.dart';

import '../../../controllers/book_mark_controller.dart';
import '../../../models/news/news_model.dart';
import '../../../services/news_local_service.dart';
import '../../../utils/injector.dart';
import '../../../widgets/news/news_content.dart';
import '../../../widgets/widgets.dart';

class BookMarkView extends StatefulWidget {
  const BookMarkView({super.key});

  @override
  State<BookMarkView> createState() => _BookMarkViewState();
}

class _BookMarkViewState extends State<BookMarkView> {
  final controller = Get.put(BookMarkController(newsLocalService: locator<NewsLocalService>()));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getNewsList();
      locator<MainRouteObserver>().onToggleBookMark = (news) {
        controller.toggleBookmark(news);
      };
    });
  }

  @override
  void dispose() {
    locator<MainRouteObserver>().onToggleBookMark = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: controller.getNewsList,
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            Obx(() {
              final newsList = controller.newsList.value;
              return SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverList.separated(
                  itemCount: newsList.length,
                  separatorBuilder: (context, index) => SpaceHeight(10.0),
                  itemBuilder: (context, index) {
                    final NewsModel news = newsList[index];
                    return NewsContent(news: news);
                  }, 
                ),
              );
            },)
          ],
        ),
      ),
    );
  }
}