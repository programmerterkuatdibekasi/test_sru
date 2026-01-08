import 'package:get/get.dart';
import 'package:test_sru/models/news/news_model.dart';
import 'package:test_sru/services/news_local_service.dart';

class NewsDetailController extends GetxController {
  final NewsLocalService newsLocalService;

  NewsDetailController({required this.newsLocalService});

  RxBool isSaved = RxBool(false);

  NewsDetailDelegate? _delegate;

  NewsDetailController setDelegate(NewsDetailDelegate delegate) {
    _delegate = delegate;
    return this;
  }

  void setIsSaved(bool isSaved) {
    this.isSaved..value = isSaved..refresh();
  }

  Future<void> checkIsSavedOnBookmark() async {
    final news = _delegate?.onGetNews();
    if(news == null) return;
    final result = newsLocalService.isNewsSaved(news);
    setIsSaved(result);
  }

  Future<void> toggleBookmark(NewsModel news) async {
    if(isSaved.value) {
      await newsLocalService.removeNews(news);
    } else {
      await newsLocalService.addNews(news);
    }
    _delegate?.onToggleBookMark.call(news);
    await checkIsSavedOnBookmark();
  }
}

class NewsDetailDelegate {
  NewsModel Function() onGetNews;
  void Function(NewsModel news) onToggleBookMark;

  NewsDetailDelegate({required this.onGetNews, required this.onToggleBookMark});
}