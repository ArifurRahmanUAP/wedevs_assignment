// ignore_for_file: non_constant_identifier_names
import 'dart:io';

import 'package:wedevs_assignment/src/features/login_screen/data/model/login_response_model.dart';
import 'package:intl/intl.dart';
import '../source/pref_manager.dart';
import '../utilities/constants.dart';

class SessionManager {
  Future<bool> createSession(LoginResponseModel userdata) async {
    try {
      var appID =
          Platform.isIOS ? Constants.APP_ID_IOS : Constants.APP_ID_ANDROID;
      final df = DateFormat('yyyy-MM-dd');
      String loginEntryDay = df.format(DateTime.now()).toString();

      setIsLoggedIn = true;
      setPlatformWiseAppId = appID;
      setLoginEntryDate = loginEntryDay;
      setToken= userdata.token;
      setUserEmail= userdata.userEmail;
      setUserNicename = userdata.userNicename;
      setUserDisplayName = userdata.userDisplayName;
      return true;
    } catch (e) {
      return false;
    }
  }

  final PrefManager _prefManager;

  SessionManager(this._prefManager);

  String? get loginEntryDate =>
      _prefManager.getStringValue(Constants.SESSION_KEY_LAST_LOGIN_TIME);

  set setLoginEntryDate(String? value) => _prefManager.saveString(
      Constants.SESSION_KEY_LAST_LOGIN_TIME, value ?? "");


  bool? get isLoggedIn =>
      _prefManager.getBoolValue(Constants.SESSION_KEY_ISLOGGEDIN);

  set setIsLoggedIn(bool value) =>
      _prefManager.saveBoolean(Constants.SESSION_KEY_ISLOGGEDIN, value);



  String? get token =>
      _prefManager.getStringValue(Constants.SESSION_KEY_TOKEN);

  set setToken(String? value) => _prefManager.saveString(
      Constants.SESSION_KEY_TOKEN, value ?? "");


  String? get userEmail =>
      _prefManager.getStringValue(Constants.SESSION_KEY_EMAIL);

  set setUserEmail(String? value) => _prefManager.saveString(
      Constants.SESSION_KEY_EMAIL, value ?? "");


  String? get userNicename =>
      _prefManager.getStringValue(Constants.SESSION_KEY_NICE_NAME);

  set setUserNicename(String? value) => _prefManager.saveString(
      Constants.SESSION_KEY_NICE_NAME, value ?? "");


  String? get userDisplayName =>
      _prefManager.getStringValue(Constants.SESSION_KEY_DISPLAY_NAME);

  set setUserDisplayName(String? value) => _prefManager.saveString(
      Constants.SESSION_KEY_DISPLAY_NAME, value ?? "");

  String? get platformWiseAppId =>
      _prefManager.getStringValue(Constants.SESSION_KEY_APP_ID);

  set setPlatformWiseAppId(String? value) => _prefManager.saveString(
      Constants.SESSION_KEY_APP_ID, value ?? "");

  clearSession() async {}

  Future<bool> logout() async {
    bool response = false;
    await _prefManager.logOut().whenComplete(() {
      response = true;
    });
    return response;
  }
}
