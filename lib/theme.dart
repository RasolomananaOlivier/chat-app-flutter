import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

ThemeData LightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF791402f)),
  );
}

ThemeData DarkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith();
}

class ThemeController extends GetxController {
  final RxBool _isDark = false.obs;

  bool get dark {
    return _isDark.value;
  }

  void toggle() {
    _isDark.value = !_isDark.value;
    Get.changeTheme(dark ? ThemeData.light() : ThemeData.dark());
  }
}
