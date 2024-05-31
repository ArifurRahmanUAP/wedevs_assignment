part of 'app_component.dart';

Future<void> initCoreExternal() async {
  //! Core

  // DioClient
  locator.registerFactory<DioClient>(() => DioClient(locator<Dio>()));

  //Session
  locator.registerLazySingleton(() => SessionManager(locator()));
  locator.registerLazySingleton(() => PrefManager(locator()));

  // dio
  locator.registerLazySingleton(() => Dio());

  // Shared preference
  final sharedPref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPref);
}
