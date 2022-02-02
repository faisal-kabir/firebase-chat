import 'dart:async';

import 'package:firebase_chat/app/data/messages.dart';
import 'package:firebase_chat/app/helper/firebase_database.dart';
import 'package:firebase_chat/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatpageController extends GetxController {
  TextEditingController message=TextEditingController();
  ScrollController scrollController = ScrollController();
  FireDatabase fireDatabase=FireDatabase();
  bool first=true;
  Messages? data;
  @override
  void onInit() {
    super.onInit();
    data=Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void sendMessage() async {
    data!.messages = await fireDatabase.getSpecificContacts(data!.docId!);
    MessagesData ms=MessagesData(
      text: message.text,
      sender: user!.docId,
      time: DateTime.now().toString(),
      isRead: false
    );
    data!.messages!.add(ms);
    fireDatabase.addMessage(data);
    message.text='';
    goEnd();
    update();
  }
  void scrollBottom() {
    if(first){
      first=false;
      goEnd();
    }
  }

  void goEnd() {
    Timer(const Duration(milliseconds: 300),(){
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    });
  }

  Stream<Messages>? getChats(BuildContext context){
    return fireDatabase.getChats(data!.docId);
  }
}
