import 'package:dartz/dartz.dart';
import 'package:test_sru/models/source/source_model.dart';
import 'package:test_sru/models/source/get_source_list_parameter.dart';
import 'package:test_sru/utils/dio_service/http_service.dart';

import '../models/api_exception.dart';

class SourceService {
  final HttpService httpService;

  SourceService({required this.httpService});

  Future<Either<ApiException, List<SourceModel>>> getList() async{
    final response = await httpService.request(
      request: GetSourceListParameter(),
      fromResponseList: SourceModel().fromResponseList,
      dataKey: SourceModel().dataKey,
    );
    return response;
  }
}