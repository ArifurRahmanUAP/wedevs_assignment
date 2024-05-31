import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/model/signup_model.dart';
import '../../data/model/signup_response_model.dart';

abstract class SignUpRepositories {
  Future<Either<Failure, SignupResponseModel>?> userSignUp(
      {required SignupModel signupModel});
}
