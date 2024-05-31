import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedevs_assignment/src/features/login_screens/data/source/login_remote_data_source.dart';

import '../../features/login_screens/data/repositories/login_repository_impl.dart';
import '../../features/login_screens/domain/repositories/login_repository.dart';
import '../../features/login_screens/domain/usecase/login_usecase.dart';
import '../../features/login_screens/ui/controller/login_controller.dart';
import '../session/session_manager.dart';
import '../source/dio_client.dart';
import '../source/pref_manager.dart';
import 'featured_di/init_signup.dart';

part 'core_external_di.dart';

part './featured_di/init_login.dart';

final locator = GetIt.instance;

Future<void> init() async {
  await initLogin();
  await initSignup();

  await initCoreExternal();
}
