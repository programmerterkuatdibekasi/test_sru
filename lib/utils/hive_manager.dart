import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:test_sru/models/news/news_model.dart';

import 'constant.dart';

class HiveManager {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(NewsModelAdapter());

    await Hive.openBox<NewsModel>(Constant.newsHiveTable);
  }
}