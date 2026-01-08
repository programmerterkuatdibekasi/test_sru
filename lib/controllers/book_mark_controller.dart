import 'package:get/get.dart';
import 'package:test_sru/services/news_local_service.dart';

import '../models/news/news_model.dart';

class BookMarkController extends GetxController {
  final NewsLocalService newsLocalService;

  BookMarkController({required this.newsLocalService});

  Rx<List<NewsModel>> newsList = Rx([]);

  Future<void> getNewsList() async {
    final result = newsLocalService.getSavedNews();
    newsList..value = result..refresh();
  }

  Future<void> toggleBookmark(NewsModel news) async {
    final index = newsList.value.indexWhere((e) => e.title == news.title);
    if (index >= 0) {
      newsList.value.removeAt(index);
    } else {
      newsList.value.insert(0, news);
    }
    newsList.refresh();
  }
}