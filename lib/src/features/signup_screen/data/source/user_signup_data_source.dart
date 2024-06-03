import '../../../../core/data/model/api_response.dart';
import '../../../../core/source/dio_client.dart';
import '../../../../core/utilities/constants.dart';
import '../model/signup_model.dart';
import '../model/signup_response_model.dart';

abstract class SignUpDataSource {
  Future<SignupResponseModel> userSignUp({required SignupModel signupModel});
}

class UserSignUpDataSourceImpl extends SignUpDataSource {
  final DioClient dioClient;

  UserSignUpDataSourceImpl({required this.dioClient});

  @override
  Future<SignupResponseModel> userSignUp(
      {required SignupModel signupModel}) async {
    logger.i(signupModel.toJson());
    Response<SignupResponseModel>? apiResponse;
    await dioClient.post(
        header: {
          "Content-Type": "application/json",
        },
        url: "https://apptest.dokandemo.com/wp-json/wp/v2/users/register",
        request: signupModel.toJson(),
        responseCallback: (response, message) {
          try {
            apiResponse =
                Response.success(SignupResponseModel.fromJson(response));
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
