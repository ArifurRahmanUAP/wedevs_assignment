import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../data/model/login_model.dart';
import '../../data/model/login_response_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseModel>?> login(
      {required LoginModel loginModel});
}
