import 'package:get/get.dart';
import 'package:test_sru/models/news/get_list_news_by_source_parameter.dart';
import 'package:test_sru/models/news/news_model.dart';
import 'package:test_sru/services/news_service.dart';
import 'package:test_sru/services/source_service.dart';

import '../models/result.dart';
import '../models/source/source_model.dart';

class HomeController extends GetxController {
  final SourceService sourceService;
  final NewsService newsService;

  HomeController({
    required this.sourceService,
    required this.newsService,
  });

  Rx<Result<List<SourceModel>>> sourceListRx = Rx(Result.initial());

  Rx<SourceModel?> selectedSourceRx = Rx(null);

  Rx<Result<List<NewsModel>>> newsListRx = Rx(Result.initial());

  Future<void> get() async {
    if (sourceListRx.value.isLoading) return;
    sourceListRx..value = Result.loading()..refresh();
    newsListRx..value = Result.loading()..refresh();

    final response = await sourceService.getList();
    response.fold(
      (l) {
        sourceListRx..value = Result.failed(l.message)..refresh();
        newsListRx..value = Result.initial()..refresh();
      }, 
      (r) {
        sourceListRx..value = Result.success(r)..refresh();
        setSelectedSource(sourceListRx.value.resultValue?.firstOrNull);
      },
    );
  }

  void setSelectedSource(SourceModel? source, {bool isInitial = true}) {
    selectedSourceRx..value = source..refresh();
    _getNewsList(isInitial: isInitial);
  }

  Future<void> _getNewsList({bool isInitial = true}) async {
    if (selectedSourceRx.value == null) return;
    if (!isInitial) {
      newsListRx..value = Result.loading()..refresh();
    }
    final parameter = GetListNewsBySourceParameter(source: selectedSourceRx.value!.id);
    final response = await newsService.getListSource(parameter: parameter);
    response.fold(
      (l) {
        newsListRx..value = Result.failed(l.message)..refresh();
      }, 
      (r) {
        newsListRx..value = Result.success(r)..refresh();
      },
    );
  }
}