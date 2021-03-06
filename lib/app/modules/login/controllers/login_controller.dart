import 'dart:convert';

import 'package:firebase_chat/app/data/user.dart';
import 'package:firebase_chat/app/helper/firebase_database.dart';
import 'package:firebase_chat/app/routes/app_pages.dart';
import 'package:firebase_chat/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey =GlobalKey();
  TextEditingController email = TextEditingController();
  FireDatabase fireDatabase = FireDatabase();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  login() async {
    if(!formKey.currentState!.validate()){
      return;
    }
    var userData = await fireDatabase.login(email.text);
    if(userData.docs.isNotEmpty){
      Map data=userData.docs[0].data();
      data['doc_id']=userData.docs[0].id;
      user = User.fromJson(data);
      prefs!.setString('user',json.encode(user!.toJson()));
      Get.toNamed(Routes.HOME);
    } else {
      Get.showSnackbar(const GetSnackBar(messageText: Text('User not found.',style:TextStyle(color: Colors.white)),duration: Duration(seconds: 1),)).show();
    }
  }
}
