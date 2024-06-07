// ignore_for_file: non_constant_identifier_names

import 'package:wedevs_assignment/src/features/login_screen/data/model/login_response_model.dart';

import '../source/pref_manager.dart';
import '../utilities/constants.dart';

class SessionManager {
  Future<bool> createSession(LoginResponseModel userdata) async {
    try {
      setIsLoggedIn = true;
      setToken = userdata.token;
      setUserEmail = userdata.userEmail;
      return true;
    } catch (e) {
      return false;
    }
  }

  final PrefManager _prefManager;

  SessionManager(this._prefManager);

  bool? get isLoggedIn =>
      _prefManager.getBoolValue(Constants.SESSION_KEY_IS_LOGGED_IN);

  set setIsLoggedIn(bool value) =>
      _prefManager.saveBoolean(Constants.SESSION_KEY_IS_LOGGED_IN, value);

  String? get token => _prefManager.getStringValue(Constants.SESSION_KEY_TOKEN);

  set setToken(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_TOKEN, value ?? "");

  String? get userEmail =>
      _prefManager.getStringValue(Constants.SESSION_KEY_EMAIL);

  set setUserEmail(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_EMAIL, value ?? "");

  String? get address =>
      _prefManager.getStringValue(Constants.SESSION_KEY_ADDRESS);

  set setAddress(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_ADDRESS, value ?? "");

  String? get aptSuit => _prefManager.getStringValue(Constants.SESSION_KEY_APT);

  set setAptSuit(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_APT, value ?? "");

  String? get zip => _prefManager.getStringValue(Constants.SESSION_KEY_ZIP);

  set setZip(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_ZIP, value ?? "");

  String? get name => _prefManager.getStringValue(Constants.SESSION_KEY_NAME);

  set setName(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_NAME, value ?? "");

  String? get userFirstName =>
      _prefManager.getStringValue(Constants.SESSION_KEY_FIRST_NAME);

  set setUserFirstName(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_FIRST_NAME, value ?? "");

  String? get userLastName =>
      _prefManager.getStringValue(Constants.SESSION_KEY_LAST_NAME);

  set setUserLastName(String? value) =>
      _prefManager.saveString(Constants.SESSION_KEY_LAST_NAME, value ?? "");

  clearSession() async {}

  Future<bool> logout() async {
    bool response = false;
    await _prefManager.logOut().whenComplete(() {
      response = true;
    });
    return response;
  }
}
