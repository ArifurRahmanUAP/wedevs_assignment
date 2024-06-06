import '../../../ProfileScreen/domain/repositories/profile_repository.dart';

abstract class ProfileUseCase {
  final ProfileRepository profileRepository;

  ProfileUseCase(this.profileRepository);
}
