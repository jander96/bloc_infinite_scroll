import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  // Dependencias de todos los restantes modulos
  configureNetworkModuleDependencies(getIt);
  getIt.init();
}