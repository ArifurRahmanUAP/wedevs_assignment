import 'package:wedevs_assignment/src/core/common_method/common_method.dart';
import 'package:wedevs_assignment/src/features/login_screen/data/model/login_response_model.dart';

import '../../../../core/data/model/api_response.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/source/dio_client.dart';
import '../model/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponseModel> login({required LoginModel loginModel});
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final DioClient dioClient;

  LoginRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<LoginResponseModel> login({required LoginModel loginModel}) async {
    Response<LoginResponseModel>? apiResponse;
    await dioClient.post(
      header: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      url: "https://apptest.dokandemo.com/wp-json/jwt-auth/v1/token",
      request: loginModel.toJson(),
      responseCallback: (response, message) {
        apiResponse = Response.success(LoginResponseModel.fromJson(response));
      },
      failureCallback: (message, status) {
        CommonMethods.showToast("UserName or Password wrong");
        apiResponse = Response.error(message, status);
        throw ServerException(message: message);
      },
    );
    return apiResponse!.data!;
  }
}
