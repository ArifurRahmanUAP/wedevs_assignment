import 'package:wedevs_assignment/src/features/login_screen/data/model/login_response_model.dart';

import '../../../../core/data/model/api_response.dart';
import '../../../../core/source/dio_client.dart';

abstract class ProfileRemoteDataSource {
  Future<LoginResponseModel> getProfileData({required Map<String, dynamic> profileParams});
}


class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final DioClient dioClient;

  ProfileRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<LoginResponseModel> getProfileData({required Map<String, dynamic> profileParams}) async {
    Response<LoginResponseModel>? apiResponse;
    await dioClient.post(
        header: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        url: "https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token",
        request: profileParams,
        responseCallback: (response, message) {
          try {
            apiResponse =
                Response.success(LoginResponseModel.fromJson(response));
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
