import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/profile_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>?> getProfileData();
  Future<Either<Failure, ProfileModel>?> updateProfileData({ required Map<String, String> data});
}
