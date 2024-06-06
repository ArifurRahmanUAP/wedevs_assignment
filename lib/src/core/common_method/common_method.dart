import 'package:flutter/material.dart';
import 'package:wedevs_assignment/src/core/extensions.dart';

class CommonMethods {
  static saveCancelButtons({
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
          child: ElevatedButton(
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
            child: Text(
              rightButtonTitle,
              style: const TextStyle(
                color: Color(0xffffffff),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
