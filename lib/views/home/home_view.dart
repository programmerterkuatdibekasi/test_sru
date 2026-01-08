import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sru/controllers/home_controller.dart';
import 'package:test_sru/services/source_service.dart';
import 'package:test_sru/utils/app_style.dart';
import 'package:test_sru/utils/injector.dart';
import 'package:test_sru/views/home/widgets/shimmer_home_news.dart';
import 'package:test_sru/widgets/news/news_content.dart';
import 'package:test_sru/widgets/widgets.dart';

import '../../models/news/news_model.dart';
import '../../models/source/source_model.dart';
import '../../services/news_service.dart';
import 'widgets/shimmer_home_source.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final controller = Get.put(
    HomeController(
      sourceService: locator<SourceService>(),
      newsService: locator<NewsService>(),
    )
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.get();
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: controller.get,
        child: SafeArea(
          child: CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Obx(() =>
                  ResultHandler(
                    requestState: controller.sourceListRx.value,
                    loadingWidget: ShimmerHomeSource(),
                    successWidget: (result) {
                      return SizedBox(
                        height: 30.0,
                        child: ListView.separated(
                          itemCount: result?.length ?? 0,
                          separatorBuilder: (context, index) => SpaceWidth(10.0),
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          itemBuilder: (context, index) {
                            final SourceModel source = result![index];
                            return Obx(
                              () {
                                final isSelected = controller.selectedSourceRx.value?.id == source.id;
                                return AppCard(
                                  radius: 50.0,
                                  borderRadius: BorderRadiusGeometry.circular(50.0),
                                  backgroundColor: isSelected ? AppColorStyle.black : AppColorStyle.lightGrey,
                                  elevation: 0.0,
                                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
                                  onTap: () {
                                    controller.setSelectedSource(source, isInitial: false);
                                  },
                                  child: Center(child: AppText(text: source.name, textStyle: AppTextStyle.h4.copyWith(color: isSelected ? Colors.white : AppColorStyle.grey)))
                                );
                              }
                            );
                          }, 
                        ),
                      );
                    },
                  )
                ),
              ),
              SliverToBoxAdapter(child: SpaceHeight(16.0)),
              Obx(() =>
                ResultHandler(
                  requestState: controller.newsListRx.value,
                  loadingWidget: SliverMarker(sliver: ShimmerHomeNews()),
                  isSliver: true,
                  successWidget: (result) {
                    return SliverMarker(
                      sliver: SliverPadding(
                        padding: const EdgeInsets.all(16.0),
                        sliver: SliverList.separated(
                          itemCount: result?.length ?? 0,
                          separatorBuilder: (context, index) => SpaceHeight(10.0),
                          itemBuilder: (context, index) {
                            final NewsModel news = result![index];
                            return NewsContent(news: news);
                          }, 
                        ),
                      ),
                    );
                  },
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}