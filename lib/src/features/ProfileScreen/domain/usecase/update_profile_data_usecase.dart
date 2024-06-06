import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use-cases/use_case.dart';
import '../../data/model/profile_model.dart';
import '../repositories/profile_repository.dart';

class UpdateProfileDataUseCase
    implements UseCase<ProfileModel, Map<String, String>> {
  UpdateProfileDataUseCase({required this.profileRepository});

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, ProfileModel>?> call(data) {
    return profileRepository.updateProfileData(data: data);
  }
}
