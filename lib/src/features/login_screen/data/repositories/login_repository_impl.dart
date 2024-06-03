import 'package:dartz/dartz.dart';
import 'package:wedevs_assignment/src/features/login_screen/domain/repositories/login_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/body.dart';
import '../model/login_model.dart';
import '../model/login_response_model.dart';
import '../source/login_remote_data_source.dart';


class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepositoryImpl({required this.loginRemoteDataSource});

  @override
  Future<Either<Failure, LoginResponseModel>> loginWithMobile(
      {required LoginModel loginModel}) async {
    return await BodyCall<LoginResponseModel>()(
      () => loginRemoteDataSource.loginWithMobile(loginModel: loginModel),
    );
  }
}
