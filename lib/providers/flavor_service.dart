import '../constants/flavor_type.dart';
import '../environments/production/production.dart';
import '../models/config/config.dart';

class FlavorService {
  late final Flavor flavor;
  late final Config config;

  FlavorService({required this.flavor}) {
    switch (flavor) {
      case Flavor.PROD:
        config = Config.fromJson(productionEnv);
        break;
    }
  }

  bool get isProduction => flavor == Flavor.PROD;
}
