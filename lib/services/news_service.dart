import 'package:dartz/dartz.dart';
import 'package:test_sru/models/news/get_list_news_by_search_parameter.dart';
import 'package:test_sru/models/news/get_list_news_by_source_parameter.dart';
import 'package:test_sru/models/news/news_model.dart';
import 'package:test_sru/utils/dio_service/http_service.dart';
import '../models/api_exception.dart';

class NewsService {
  final HttpService httpService;

  NewsService({required this.httpService});

  Future<Either<ApiException, List<NewsModel>>> getListSource({required final GetListNewsBySourceParameter parameter}) async{
    final response = await httpService.request(
      request: parameter,
      fromResponseList: NewsModel().fromResponseList,
      dataKey: NewsModel().dataKey,
    );
    return response;
  }
  Future<Either<ApiException, List<NewsModel>>> getListBySearch({required final GetListNewsBySearchParameter parameter}) async{
    final response = await httpService.request(
      request: parameter,
      fromResponseList: NewsModel().fromResponseList,
      dataKey: NewsModel().dataKey,
    );
    return response;
  }
}