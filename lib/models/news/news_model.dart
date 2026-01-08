import 'package:hive_ce/hive_ce.dart';
import 'package:test_sru/utils/dio_service/dio_service_response.dart';
part 'news_model.g.dart';

@HiveType(typeId: 0)
class NewsModel extends HiveObject with DioServiceResponse<NewsModel> {
  @HiveField(0)
  final String author;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String content;

  @HiveField(4)
  final String urlImage;

  @HiveField(5)
  final DateTime? publishedAt;

  NewsModel({
    this.author = "",
    this.title = "",
    this.description = "",
    this.content = "",
    this.urlImage = "",
    this.publishedAt,
  });

  @override
  NewsModel fromResponseMap(Map<String, dynamic> json) {
    return NewsModel(
      author: json["author"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      content: json["content"] ?? "",
      urlImage: json["urlToImage"] ?? "",
      publishedAt: DateTime.tryParse(json["publishedAt"] ?? ""),
    );
  }

  @override
  String get dataKey => "articles";
}
