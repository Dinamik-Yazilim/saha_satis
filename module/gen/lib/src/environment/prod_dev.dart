// lib/env/env.dart
import 'package:envied/envied.dart';

import 'app_configuration.dart';

part 'prod_dev.g.dart';

@Envied(obfuscate: true, path: 'assets/env/.prod.env')
final class ProdEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _ProdEnv._baseUrl;
  @EnviedField(varName: 'API_KEY')
  static final String _apiKey = _ProdEnv._apiKey;

  @override
  String get baseUrl => _baseUrl;

  @override
  String get apiKey => _apiKey;
}
