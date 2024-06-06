// ignore_for_file: non_constant_identifier_names, constant_identifier_names, unnecessary_string_escapes, depend_on_referenced_packages

import 'package:logger/logger.dart';

class Constants {
  static const APP_ID_ANDROID = '1';
  static const APP_ID_IOS = '2';

  static const SESSION_KEY_IS_LOGGED_IN = "isloggedin";
  static const SESSION_KEY_TOKEN = "token";
  static const SESSION_KEY_EMAIL = "email";
  static const SESSION_KEY_NICE_NAME = "usernickname";
  static const SESSION_KEY_DISPLAY_NAME = "userdisplayname";
  static const SESSION_KEY_ADDRESS = "address";
  static const SESSION_KEY_APT = "apt";
  static const SESSION_KEY_ZIP = "zip";
  static const SESSION_KEY_NAME = "name";
  static const SESSION_KEY_FIRST_NAME = "firstName";
  static const SESSION_KEY_LAST_NAME = "lastName";
  static const SESSION_KEY_IMAGE_URL = "imageUrl";
  static const SESSION_KEY_DESCRIPTION = "description";

  static num USER_ID = 0;

  static const MESSAGE_NO_INTERNET =
      "You are not connceted to internet. Please turn on wifi or mobile internet then try again.";
}

final logger = Logger();
