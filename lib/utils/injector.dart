import 'package:get_it/get_it.dart';
import 'package:test_sru/services/news_service.dart';
import 'package:test_sru/services/source_service.dart';
import 'package:test_sru/utils/dio_service/http_service.dart';
import 'package:test_sru/utils/main_route_observer.dart';

import '../services/news_local_service.dart';

final GetIt locator = GetIt.instance;
class Injector {
  Injector._();
  
  static void setUp() {
    locator.registerLazySingleton<NewsService>(() => NewsService(httpService: locator<HttpService>()));
    locator.registerLazySingleton<SourceService>(() => SourceService(httpService: locator<HttpService>()));
    locator.registerLazySingleton<NewsLocalService>(() => NewsLocalService());
    
    locator.registerLazySingleton<MainRouteObserver>(() => MainRouteObserver());

    locator.registerLazySingleton<HttpService>(() => const HttpService());
  }
}