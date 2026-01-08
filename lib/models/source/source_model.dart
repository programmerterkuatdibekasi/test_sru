import 'package:test_sru/utils/dio_service/dio_service_response.dart';

class SourceModel with DioServiceResponse<SourceModel> {
  final String id;
  final String name;

  SourceModel({
    this.id = "",
    this.name = "",
  });

  @override
  String get dataKey => "sources";

  @override
  SourceModel fromResponseMap(Map<String, dynamic> json) {
    return SourceModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
    );
  }
}
