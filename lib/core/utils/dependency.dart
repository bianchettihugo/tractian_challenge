import 'package:get_it/get_it.dart';

class Dependency {
  static T get<T extends Object>() {
    return GetIt.I.get<T>();
  }

  static void register<T extends Object>(T instance) {
    GetIt.I.registerSingleton<T>(instance);
  }
}
