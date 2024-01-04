
import 'package:injectable/injectable.dart';
abstract class Env{
  abstract final String baseUrl;
}

@Environment('dev')
@Singleton(as:Env)
class Development extends Env{
  final String baseUrl = 'https://api.disneyapi.dev';
}

@Environment('prod')
@Singleton(as:Env)
class Production extends Env{
  final String baseUrl = 'https://api.disneyapi.dev';
}