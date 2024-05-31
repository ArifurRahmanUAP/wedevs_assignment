// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';

class NetworkConfiguration {
  static const String BASE_URL = "http://apptest.dokandemo.com/wp-json";


  //--------------------------------------------------------------------------//

  static const int CONNECTION_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;

  //-------------------------------------------------------------------------//

  static const String HEADER_KEY_CONTENT_TYPE = "application/x-www-form-urlencoded";

  //--------------------------------------------------------------------------//

  static final baseOptions = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: const Duration(milliseconds: CONNECTION_TIMEOUT),
    receiveTimeout: const Duration(milliseconds: RECEIVE_TIMEOUT),
    contentType: ContentType.parse(HEADER_KEY_CONTENT_TYPE).toString(),
    headers: {
      HttpHeaders.contentTypeHeader: HEADER_KEY_CONTENT_TYPE,
    },
  );
}
