import 'package:test_sru/utils/dio_service/dio_service_request.dart';

class GetSourceListParameter with DioServiceRequest {
  @override
  DioMethod get dioMethod => DioMethod.GET;

  @override
  String get path => "/top-headlines/sources";
}