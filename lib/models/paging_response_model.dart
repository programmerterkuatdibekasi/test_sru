
import 'package:test_sru/utils/model_parser.dart';

class PagingResponseModel<T> {
  final int page;
  final int totalPage;
  final int totalItem;
  final List<T> itemList;

  PagingResponseModel({
    required this.page,
    required this.totalPage,
    required this.totalItem,
    required this.itemList
  });

  factory PagingResponseModel.fromJson(dynamic response, List<T> Function(dynamic data) dataFromJson) {
    final bool isResponseMap = response is Map<String, dynamic>;
    dynamic data = isResponseMap ? response['data'] : response;
    int page = 1;
    int totalPage = 1;
    int totalItem = -1;
    if (isResponseMap) {
      if (response['page'] != null) {
        final pageRaw = response['page'];
        if (pageRaw is Map<String,dynamic>) {
          page = ModelParser.intFromJson(pageRaw['page']) ?? 1; 
          if (page == 0) {
            page = 1;
          }
          totalPage = ModelParser.intFromJson(pageRaw['total_page']) ?? 1;
          if (totalPage == 0) {
            totalPage = 1;
          }
          totalItem = ModelParser.intFromJson(pageRaw['total_item']) ?? 0;
        }
      } else {
        page = ModelParser.intFromJson(response['current_page']) ?? 1;
        totalPage = ModelParser.intFromJson(response['last_page']) ?? 1;
        totalItem = ModelParser.intFromJson(response['total']) ?? -1;
      }
    }
    return PagingResponseModel<T>(
      page: page,
      totalPage: totalPage,
      totalItem: totalItem,
      itemList: dataFromJson(data)
    );
  }
}