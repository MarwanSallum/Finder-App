import 'package:finder_app/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInputDecoration{
  BaseTheme baseTheme;

  AppInputDecoration({required this.baseTheme});

  InputDecorationTheme themeData(){
    return InputDecorationTheme(
      isCollapsed: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: baseTheme.primaryColor, width: 3),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: baseTheme.primaryColor),
      ),
      contentPadding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.10, vertical: Get.height * 0.020),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}