import 'package:dartz/dartz.dart';
import 'package:wedevs_assignment/src/core/error/failures.dart';
import '../../../../core/use-cases/use_case.dart';
import '../../data/model/login_model.dart';
import '../../data/model/login_response_model.dart';
import '../repositories/login_repository.dart';

class LoginUseCase implements UseCase<LoginResponseModel, LoginModel> {
  LoginUseCase({required this.loginRepositories});

  final LoginRepository loginRepositories;

  @override
  Future<Either<Failure, LoginResponseModel>?> call(LoginModel params) {
    return loginRepositories.loginWithMobile(loginModel: params);
  }
}
