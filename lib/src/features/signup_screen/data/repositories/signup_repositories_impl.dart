import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/body.dart';
import '../../domain/repositories/signup_repositories.dart';
import '../model/signup_model.dart';
import '../model/signup_response_model.dart';
import '../source/user_signup_data_source.dart';

class SignUpRepositoriesImpl implements SignUpRepositories {
  final SignUpDataSource signUpDataSource;

  SignUpRepositoriesImpl({required this.signUpDataSource});

  @override
  Future<Either<Failure, SignupResponseModel>?> userSignUp(
      {required SignupModel signupModel}) async {
    return await BodyCall<SignupResponseModel>()(
      () => signUpDataSource.userSignUp(signupModel: signupModel),
    );
  }
}
