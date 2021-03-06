import 'dart:async';
import 'dart:convert';

import 'package:firebase_chat/app/data/user.dart';
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
      //prefs!.clear();
      if(prefs!.containsKey('user')) {
        user=User.fromJson(json.decode(prefs!.getString('user')!));
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
