import 'dart:core';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../../main.dart';
import '../session/session_manager.dart';
import '../utilities/constants.dart';

class DioClient {
  final Dio dio;


  DioClient(this.dio);



  Future<Response?> post({
    required String url,
    dynamic request,
    required Function(dynamic, String?) responseCallback,
    required Function(String?, int?) failureCallback,
    dynamic header,
  }) async {

    Response? response;
    try {
        response = await dio.post(
          url,
          data: request,
          options: Options(
            method: "POST",
            headers: header ?? getHeader(session),
            contentType:
            // ContentType.parse(NetworkConfiguration.HEADER_KEY_CONTENT_TYPE)
            //     .toString(),
            "application/json",
            receiveTimeout: const Duration(milliseconds: 30000),
          ),
        );
        logger.i(url);
        logger.i(request);
        // logger.i(getHeader(session));
        logger.i(response);

        if (response.data != null) {
          responseCallback(response.data, response.statusMessage);
        } else {
          failureCallback(response.statusMessage, response.statusCode);
        }
    } catch (e) {
      logger.d(e.toString());
      failureCallback("Something went wrong!", 400);
    }
    return response;
  }

  Future<Response?> get({
    required String url,
    dynamic request,
    required Function(dynamic, String?) responseCallback,
    required Function(String?, int?) failureCallback,
    Map<String, String>? queryParameters,
    bool includeHeader = false,
  }) async {
    Response? response;
    try {
        response = await dio.get(
          url,
          queryParameters: queryParameters,
          options: Options(
            // headers: includeHeader ? getHeader(locator<SessionManager>()) : {},
            contentType: Headers.formUrlEncodedContentType,
            receiveTimeout: const Duration(milliseconds: 3000),
          ),
        );
        if (response.data != null && response.statusCode == HttpStatus.ok) {
          responseCallback(response.data, response.statusMessage);
        } else {
          failureCallback(response.statusMessage, response.statusCode);
        }
    } on Exception catch (e, _) {
      failureCallback("⚠ Sorry, Please try again", 400);
    }
    return response;
  }

  Map<String, dynamic> getHeader(SessionManager session) {
    // logger.d('cCode: ${session.companyCode} :: cId: ${session.companyId} :: cc: ${session.companyCreation} :: lId: ${session.loginId} :: X_Api_Auth: ${session.comCODE}');
    return {

    };
  }
}

