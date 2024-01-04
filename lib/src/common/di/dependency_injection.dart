
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true,
  externalPackageModules: [
    NetworkPackageModule
  ]// default
)
void configureDependencies({required String environment}) {
  getIt.init(environment: environment );
}

enum Env{
  prod('prod'),
  dev('dev'),
  test('test');
  final String name;
  const Env(this.name);
}