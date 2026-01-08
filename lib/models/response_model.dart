class ResponseModel<T> {
  final String message;
  final T? data;

  ResponseModel({required this.message, this.data});

  factory ResponseModel.fromJson(
    dynamic json,
    String dataKey,
    Function(dynamic data) dataFromJson,
  ) {
    return ResponseModel(
      message: json['message'] ??
          (json['error'] is List
              ? (json['error'] as List).join(",")
              : json['error']) ??
          (json['errors'] is List
              ? (json['errors'] as List).join(",")
              : json['errors'] is String
              ? json['errors']
              : "") ?? "",
      data: json[dataKey] != null && json[dataKey].isNotEmpty
          ? dataFromJson(json[dataKey])
          : null,
    );
  }
}
