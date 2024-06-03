import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/body.dart';
import '../../../login_screen/data/model/login_response_model.dart';
import '../../domain/repositories/profile_repository.dart';
import '../source/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, LoginResponseModel>> getProfileData({
    required Map<String, dynamic> profileParams,
  }) async {
    return await BodyCall<LoginResponseModel>()(
      () =>
          profileRemoteDataSource.getProfileData(profileParams: profileParams),
    );
  }
}
