class EnvConfig {
  EnvConfig._();
  
  static final _envConfig = EnvConfig._();
  
  static EnvConfig get instance => _envConfig;
  String get baseUrl => "https://newsapi.org";
  String get api => "$baseUrl/v2";
  String get apiKey => "eade325a45f14941bf87b7833409cd54";
}