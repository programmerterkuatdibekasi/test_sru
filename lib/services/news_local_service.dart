import 'package:hive_ce/hive_ce.dart';
import 'package:test_sru/utils/constant.dart';

import '../models/news/news_model.dart';

class NewsLocalService {
  Box<NewsModel> get _box => Hive.box<NewsModel>(Constant.newsHiveTable);


  Future<void> addNews(NewsModel news) async {
    await _box.put(news.title, news);
  }

  Future<void> removeNews(NewsModel news) async {
    await _box.delete(news.title);
  }

  bool isNewsSaved(NewsModel news) {
    try {
      return _box.containsKey(news.title);
    } catch (e) {
      return false;
    }
  }

  List<NewsModel> getSavedNews() {
    return _box.values.toList();
  }
}