import 'package:finder_app/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppElevatedButtonStyle {
  BaseTheme baseTheme;

  AppElevatedButtonStyle({required this.baseTheme});

  ElevatedButtonThemeData themeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(baseTheme.primaryColor),
        maximumSize: MaterialStateProperty.all<Size>(
          Size(Get.width * 0.90, Get.height * 0.07),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(Get.width * 0.90, Get.height * 0.07),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.pink)
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }
}
