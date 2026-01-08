import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sru/gen/assets.gen.dart';
import 'package:test_sru/services/news_service.dart';
import 'package:test_sru/utils/injector.dart';
import 'package:test_sru/widgets/news/news_content.dart';
import 'package:test_sru/widgets/widgets.dart';
import '../../controllers/search_news_controller.dart';
import '../../models/news/news_model.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final SearchNewsController controller = Get.put(SearchNewsController(newsService: locator<NewsService>()));

  @override
  void dispose() {
    EasyDebounce.cancel("Search");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppForm(
              prefix: Assets.images.searchUnselected.image(
                height: 17.0,
                width: 17.0,
              ),
              hintText: "Search",
              controller: controller.searchController,
              showClear: true,
              onChanged: (value) {
                EasyDebounce.debounce(
                  'search',
                  const Duration(milliseconds: 500),
                  () async {
                    controller.setFutureNewsList(future: controller.getList(query: value));
                  },
                );
              },
            ),
          ),
          Expanded(
            child: CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              slivers: [
                Obx(() {
                  return FutureBuilder(
                    future: controller.futureNewsList.value,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SliverToBoxAdapter(child: const LoadingWidget());
                      }
                      if (snapshot.hasData && (snapshot.data?.isSuccess ?? false)) {
                        final List<NewsModel> newsList = snapshot.data?.resultValue ?? [];
                        return SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          sliver: SliverList.separated(
                            itemCount: newsList.length,
                            separatorBuilder: (context, index) => SpaceHeight(10.0),
                            itemBuilder: (context, index) {
                              final NewsModel news = newsList[index];
                              return NewsContent(news: news);
                            }, 
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    },
                  );
             
                },)
              ],
            )
          )
        ],
      ),
    );
  }
}