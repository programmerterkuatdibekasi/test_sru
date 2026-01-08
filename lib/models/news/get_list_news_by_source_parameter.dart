import 'package:test_sru/utils/dio_service/dio_service_request.dart';

class GetListNewsBySourceParameter with DioServiceRequest {
  final String source;

  GetListNewsBySourceParameter({required this.source});

  @override
  DioMethod get dioMethod => DioMethod.GET;

  @override
  String get path => "/everything";

  @override
  Map<String, dynamic> toJson() {
    return {"sources": source};
  }
}