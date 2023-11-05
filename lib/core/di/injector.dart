import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

final getIt = GetIt.instance;

const platformMobile = Environment('platformMobile');
const platformWeb = Environment('platformWeb');

@InjectableInit(preferRelativeImports: true)
configureDependencies(
    GetIt getIt, {
      String? env,
      EnvironmentFilter? environmentFilter,
    }) {
  return getIt.init(
    environmentFilter: environmentFilter,
    environment: env,
  );
}