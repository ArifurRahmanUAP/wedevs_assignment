// part of '../app_component.dart';


// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:wedevs_assignment/src/features/signup_screens/data/repositories/signup_repositories_impl.dart';
import 'package:wedevs_assignment/src/features/signup_screens/data/source/user_signup_data_source.dart';
import 'package:wedevs_assignment/src/features/signup_screens/domain/repositories/signup_repositories.dart';
import 'package:wedevs_assignment/src/features/signup_screens/domain/usecase/user_signup_usecase.dart';
import 'package:wedevs_assignment/src/features/signup_screens/ui/controller/signup_screen_controller.dart';

import '../../../features/login_screens/data/repositories/login_repository_impl.dart';
import '../app_component.dart';

Future<void> initSignup()  async {
//! Controller
  locator.registerFactory(
        () => Get.put(
      SignupScreenController(signUpRepositories: locator()),
    ),
  );
//! Use cases
  locator.registerLazySingleton(
        () => UserSignUpUseCase(
      signUpRepositories: locator(),
    ),
  );

//! Repositories
  locator.registerLazySingleton<SignUpRepositories>(
        () => SignUpRepositoriesImpl(
      signUpDataSource: locator(),
    ),
  );

//! Data sources
  locator.registerLazySingleton<SignUpDataSource>(
        () => UserSignUpDataSourceImpl(
      dioClient: locator(),
    ),
  );
}
