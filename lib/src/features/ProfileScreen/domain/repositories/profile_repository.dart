import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../login_screen/data/model/login_response_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, LoginResponseModel>?> getProfileData(
  {required Map<String, dynamic> profileParams});
}
