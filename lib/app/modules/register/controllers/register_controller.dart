import 'dart:convert';

import 'package:firebase_chat/app/data/user.dart';
import 'package:firebase_chat/app/helper/firebase_database.dart';
import 'package:firebase_chat/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formKey =GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController photo = TextEditingController();
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

  register() async {
    if(!formKey.currentState!.validate()){
      return;
    }
    User us = User(
      name: name.text,
      email: email.text,
      photo: photo.text,
      docId: 'doc_id'
    );
    Map temp=us.toJson();
    temp.remove('doc_id');
    var userData = await fireDatabase.register(temp);
    if(userData!=null){
      var us = await fireDatabase.getUser(userData.id);
      Map data= us.data();
      data['doc_id']=us.id;
      user = User.fromJson(data);
      prefs!.setString('user',json.encode(user!.toJson()));
      Get.toNamed(Routes.HOME);
    } else {
      Get.showSnackbar(const GetSnackBar(messageText: Text('Something went wrong',style:TextStyle(color: Colors.white)),duration: Duration(seconds: 1),)).show();
    }
  }
}
