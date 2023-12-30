import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:network/src/network/di/injection.config.dart';

@InjectableInit(
    initializerName: r'$initNetworkModuleGetIt'
)
final getIt = GetIt.instance;
void configureNetworkModuleDependencies(GetIt getIt) =>
    getIt.$initNetworkModuleGetIt();