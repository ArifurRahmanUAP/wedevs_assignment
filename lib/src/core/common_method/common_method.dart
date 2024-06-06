import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:wedevs_assignment/src/core/extensions.dart';

import '../utilities/assets_path.dart';

class CommonMethods {
  static saveCancelButtons({
    required Rx<bool> isLoading,
    required String leftButtonTitle,
    required String rightButtonTitle,
    required VoidCallback leftButtonCallBack,
    required VoidCallback rightButtonCallBack,
  }) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => leftButtonCallBack(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xffbababa)),
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(8), // Set the border radius here
              ),
            ),
            child: Text(
              leftButtonTitle,
              style: const TextStyle(
                color: Color(0xff607374),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
        ),
        20.pw,
        Expanded(
          child: Obx(() {
            return ElevatedButton(
              onPressed: () => rightButtonCallBack(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1ABC9C),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(8), // Set the border radius here
                ),
              ),
              child: isLoading.value
                  ? const CircularProgressIndicator(
                color: Colors.white,
              )
                  : Text(
                rightButtonTitle,
                style: const TextStyle(
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  static socialMediaSignUp({required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 2,
          child: Container(
            height: 56,
            width: 56,
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              AssetsPath.FACEBOOK_LOGO,
            ),
          ),
        ),
        20.pw,
        Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 2,
          child: Container(
            height: 56,
            width: 56,
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              AssetsPath.GOOGLE_LOGO,
            ),
          ),
        ),
      ],
    );
  }

  static showToast(String message,) {
    Fluttertoast.showToast(
      msg: message,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 4,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
    );
  }

  static showMessage(context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: color,
      ),
    );
  }
}
