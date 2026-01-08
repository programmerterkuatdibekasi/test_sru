import 'package:dio/dio.dart';

class OptionsBuilder {
  String? _baseUrl;
  String? _method;
  Map<String, dynamic>? _headers;
  Duration? _sendTimeout;
  Duration? _receiveTimeout;
  String? _contentType;
  ResponseType? _responseType;
  ValidateStatus? _validateStatus;
  bool? _receiveDataWhenStatusError;
  Map<String, dynamic>? _extra;
  bool? _followRedirects;
  int? _maxRedirects;
  RequestEncoder? _requestEncoder;
  ResponseDecoder? _responseDecoder;
  ListFormat? _listFormat;

  OptionsBuilder();

  factory OptionsBuilder.multipartData({String? baseUrl}) {
    return OptionsBuilder().withMultipartData(baseurl: baseUrl);
  }

  factory OptionsBuilder.withBaseUrl(String? baseUrl) {
    return OptionsBuilder().withBaseUrl(baseUrl);
  }

  OptionsBuilder withMultipartData({String? baseurl}) {
    _method = "multipart/form-data";
    if(baseurl != null) {
      _baseUrl = baseurl;
    }
    return this;
  }

  OptionsBuilder withBaseUrl(String? baseUrl) {
    _baseUrl = baseUrl;
    return this;
  }


  BuiltOptions build() {
    return BuiltOptions(
      baseUrl: _baseUrl,
      options: Options(
        method: _method,
        sendTimeout: _sendTimeout,
        receiveTimeout: _receiveTimeout,
        extra: _extra,
        headers: _headers,
        responseType: _responseType,
        contentType: _contentType,
        validateStatus: _validateStatus,
        receiveDataWhenStatusError: _receiveDataWhenStatusError,
        followRedirects: _followRedirects,
        maxRedirects: _maxRedirects,
        requestEncoder: _requestEncoder,
        responseDecoder: _responseDecoder,
        listFormat: _listFormat,
      )
    );
  }
}

class BuiltOptions {
  final String? baseUrl;
  final Options options;

  BuiltOptions({
    required this.baseUrl,
    required this.options,
  });
}