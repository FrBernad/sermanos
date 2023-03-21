import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Env {
  late final String apiBaseUrl;
}

class EnvImpl implements Env {
  @override
  String apiBaseUrl = dotenv.get('API_BASE_URL');
}

final env = EnvImpl();
