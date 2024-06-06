import '../../../../core/use-cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:wedevs_assignment/src/core/error/failures.dart';
import '../../data/model/profile_model.dart';
import '../repositories/profile_repository.dart';

class GetProfileDataUseCase implements UseCase<ProfileModel, NoParams> {
GetProfileDataUseCase({required this.profileRepository});

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, ProfileModel>?> call(NoParams noParams) {
    return profileRepository.getProfileData();
  }
}
