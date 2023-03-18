enum Flavor {
  development,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  /// Adds flavor to the name of the app
  static String get title => 'Ser Manos $name';

  /// Defines the environment variables filename for each flavor
  static String get envFileName => 'lib/config/env/.env.${appFlavor?.name}';
}
