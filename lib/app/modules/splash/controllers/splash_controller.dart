import 'dart:async';

import 'package:firebase_chat/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    SharedPreferences.getInstance().then((pr) {
      prefs = pr;
    });
    Timer(const Duration(seconds: 3),(){
      if(prefs!.containsKey('user')) {
        Get.toNamed(Routes.HOME);
      } else {
        Get.toNamed(Routes.LOGIN);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
