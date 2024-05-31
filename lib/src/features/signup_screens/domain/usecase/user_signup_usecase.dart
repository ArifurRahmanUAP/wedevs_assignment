import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/use-cases/use_case.dart';
import '../../data/model/signup_model.dart';
import '../../data/model/signup_response_model.dart';
import '../repositories/signup_repositories.dart';

class UserSignUpUseCase implements UseCase<SignupResponseModel, SignupModel> {
  UserSignUpUseCase({required this.signUpRepositories});

  final SignUpRepositories signUpRepositories;

  @override
  Future<Either<Failure, SignupResponseModel>?> call(SignupModel signupModel) {
    return signUpRepositories.userSignUp(signupModel: signupModel);
  }
}
