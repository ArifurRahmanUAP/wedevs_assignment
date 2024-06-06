import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/body.dart';
import '../../domain/repositories/profile_repository.dart';
import '../model/profile_model.dart';
import '../source/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure, ProfileModel>> getProfileData() async {
    return await BodyCall<ProfileModel>()(
      () => profileRemoteDataSource.getProfileData(),
    );
  }

  @override
  Future<Either<Failure, ProfileModel>> updateProfileData({
    required Map<String, String> data,
  }) async {
    return await BodyCall<ProfileModel>()(
      () => profileRemoteDataSource.updateProfileData(data: data,),
    );
  }
}
