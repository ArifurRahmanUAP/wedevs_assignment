import 'package:wedevs_assignment/src/features/login_screens/data/model/login_response_model.dart';

import '../../../../core/data/model/api_response.dart';
import '../../../../core/source/dio_client.dart';
import '../model/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> loginWithMobile({required LoginModel loginModel});
}


class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final DioClient dioClient;

  LoginRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<LoginResponseModel> loginWithMobile({required LoginModel loginModel}) async {
    Response<LoginResponseModel>? apiResponse;
    await dioClient.post(
        header: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        url: "https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token",
        request: loginModel.toJson(),
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
