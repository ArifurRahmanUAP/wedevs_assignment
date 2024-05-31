// ignore_for_file: non_constant_identifier_names, constant_identifier_names, unnecessary_string_escapes, depend_on_referenced_packages

import 'package:logger/logger.dart';

class Constants {
  static const APP_ID_ANDROID = '1';
  static const APP_ID_IOS = '2';

  static const SESSION_KEY_ISLOGGEDIN = "isloggedin";
  static const SESSION_KEY_LAST_LOGIN_TIME = "LastLoginTime";
  static const SESSION_KEY_TOKEN = "token";
  static const SESSION_KEY_EMAIL = "email";
  static const SESSION_KEY_NICE_NAME = "usernickname";
  static const SESSION_KEY_DISPLAY_NAME = "userdisplayname";
  static const SESSION_KEY_APP_ID = "appId";

  static const MESSAGE_NO_INTERNET =
      "You are not connceted to internet. Please turn on wifi or mobile internet then try again.";

}

final logger = Logger();
