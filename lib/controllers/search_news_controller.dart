import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_sru/models/news/news_model.dart';
import 'package:test_sru/models/result.dart';
import 'package:test_sru/services/news_service.dart';

import '../models/news/get_list_news_by_search_parameter.dart';

class SearchNewsController extends GetxController {
  final NewsService newsService;

  SearchNewsController({
    required this.newsService,
  });

  final TextEditingController searchController = TextEditingController();

  Rx<Future<Result<List<NewsModel>>>?> futureNewsList = Rx(null);

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void setFutureNewsList({Future<Result<List<NewsModel>>>? future}) {
    futureNewsList.value = future;
    futureNewsList.refresh();
  }

  Future<Result<List<NewsModel>>> getList({required final String query}) async {
    if(query.isEmpty) return Future.value(Result.initial());
    final response = await newsService.getListBySearch(parameter: GetListNewsBySearchParameter(query: query));
    return response.fold(
      (l) => Result.failed(l.message),
      (r) => Result.success(r),
    );
  }
}
