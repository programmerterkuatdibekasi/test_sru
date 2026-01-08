import 'package:test_sru/utils/dio_service/dio_service_request.dart';

class GetListNewsBySearchParameter with DioServiceRequest {
  final String query;

  GetListNewsBySearchParameter({required this.query});

  @override
  DioMethod get dioMethod => DioMethod.GET;

  @override
  String get path => "/everything";

  @override
  Map<String, dynamic> toJson() {
    return {"q": query};
  }
}