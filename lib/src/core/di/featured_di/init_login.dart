part of '../app_component.dart';

Future<void> initLogin()  async {
//! Controller
  locator.registerFactory(
    () => Get.put(
      LoginController(loginUseCase: locator()),
    ),
  );
//! Use cases
  locator.registerLazySingleton(
    () => LoginUseCase(
      loginRepositories: locator(),
    ),
  );

//! Repositories
  locator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      loginRemoteDataSource: locator(),
    ),
  );

//! Data sources
  locator.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(
      dioClient: locator(),
    ),
  );
}
