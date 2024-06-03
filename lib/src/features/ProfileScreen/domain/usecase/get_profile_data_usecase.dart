import 'package:wedevs_assignment/src/features/login_screen/data/model/login_response_model.dart';

import '../../../../core/use-cases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:wedevs_assignment/src/core/error/failures.dart';
import '../repositories/profile_repository.dart';

class GetProfileDataUseCase implements UseCase<LoginResponseModel, Map<String, dynamic>> {
GetProfileDataUseCase({required this.profileRepository});

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, LoginResponseModel>?> call(Map<String, dynamic> profileParams) {
    return profileRepository.getProfileData(profileParams: profileParams);
  }
}
