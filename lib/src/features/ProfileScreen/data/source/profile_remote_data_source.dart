import 'package:wedevs_assignment/main.dart';
import 'package:wedevs_assignment/src/core/utilities/constants.dart';

import '../../../../core/data/model/api_response.dart';
import '../../../../core/source/dio_client.dart';
import '../model/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfileData();

  Future<ProfileModel> updateProfileData(
      { required Map<String, String> data});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final DioClient dioClient;

  ProfileRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<ProfileModel> getProfileData() async {
    Response<ProfileModel>? apiResponse;
    await dioClient.post(
        header: {
          "Authorization": "Bearer ${session.token}",
          "Content-Type": "application/json",
        },
        url: "https://apptest.dokandemo.com/wp-json/wp/v2/users/me",
        responseCallback: (response, message) {
          try {
            apiResponse = Response.success(ProfileModel.fromJson(response));
            logger.e(apiResponse);
          } catch (e) {
            apiResponse = Response.error(e.toString(), 500);
          }
        },
        failureCallback: (message, status) {
          apiResponse = Response.error(message, status);
        });
    return apiResponse!.data!;
  }

  @override
  Future<ProfileModel> updateProfileData(
      { required Map<String, String> data}) async {
    Response<ProfileModel>? apiResponse;
    await dioClient.post(
        header: <String, String>{
          "Authorization": "Bearer ${session.token}",
          "Content-Type": "application/json",
        },
        request: data,
        url: "https://apptest.dokandemo.com/wp-json/wp/v2/users/${Constants.USER_ID}",
        responseCallback: (response, message) {
          try {
            apiResponse = Response.success(ProfileModel.fromJson(response));
            session.setAddress = data["address"]!;
            session.setAptSuit = data["aptSuit"]!;
            session.setZip = data["zip"]!;
          } catch (e) {
            apiResponse = Response.error(e.toString(), 500);
          }
        },
        failureCallback: (message, status) {
          apiResponse = Response.error(message, status);
        });
    return apiResponse!.data!;
  }
}
