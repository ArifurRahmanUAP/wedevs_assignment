import 'package:get/get.dart';
import 'package:wedevs_assignment/src/features/ProfileScreen/data/source/profile_remote_data_source.dart';
import 'package:wedevs_assignment/src/features/ProfileScreen/domain/repositories/profile_repository.dart';
import 'package:wedevs_assignment/src/features/ProfileScreen/domain/usecase/get_profile_data_usecase.dart';

import '../../../features/ProfileScreen/data/repositories/profile_repository_impl.dart';
import '../../../features/ProfileScreen/ui/controller/profile_screen_controller.dart';
import '../app_component.dart';

Future<void> initProfile()  async {
//! Controller
  locator.registerFactory(
        () => Get.put(
      ProfileScreenController(getProfileDataUseCase: locator()),
    ),
  );
//! Use cases
  locator.registerLazySingleton(
        () => GetProfileDataUseCase(
      profileRepository: locator(),
    ),
  );

//! Repositories
  locator.registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(
      profileRemoteDataSource: locator(),
    ),
  );

//! Data sources
  locator.registerLazySingleton<ProfileRemoteDataSource>(
        () => ProfileRemoteDataSourceImpl(
      dioClient: locator(),
    ),
  );
}
