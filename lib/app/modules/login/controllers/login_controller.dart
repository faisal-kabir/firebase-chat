import 'package:firebase_chat/app/helper/firebase_database.dart';
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
    var user = await fireDatabase.login(email.text);
    if(user.docs.isNotEmpty){
      print(user.docs[0].id);
      print(user.docs[0].data());
    } else {
      Get.showSnackbar(GetSnackBar(messageText: Text('User not found.',style:TextStyle(color: Colors.white)),duration: Duration(seconds: 1),)).show();
    }
  }
}
