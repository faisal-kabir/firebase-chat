import 'package:firebase_chat/app/data/messages.dart';
import 'package:firebase_chat/main.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chatpage_controller.dart';

class ChatpageView extends GetView<ChatpageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatpageController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.data!.other!.name!),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                    child: StreamBuilder<Messages>(
                      stream: controller.getChats(context),
                      builder: (context,snapshot){
                        Widget view;
                        if(!snapshot.hasData || snapshot.data!.messages!.isEmpty) {
                          view = emptyView();
                        } else {
                          controller.scrollBottom();
                          view = ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.messages!.length,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(bottom: (70),left: 10,right: 10),
                            itemBuilder: (context, index) {
                              return messageView(snapshot.data!.messages![index]);
                            },
                          );
                        }
                        return ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          controller: controller.scrollController,
                          children: [
                            view
                          ],
                        );
                      },
                    )
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 60,
                    width: Get.width,
                    color: Colors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                              height: 50,
                              child: TextFormField(
                                controller: controller.message,
                              )
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            if(controller.message.text.isNotEmpty){
                              controller.sendMessage();
                            }
                          },
                          icon: Icon(Icons.send,),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
  Widget emptyView(){
    return Text('No Messages');
  }

  Widget messageView(MessagesData document) {
    bool isMind=document.sender==user!.docId;
    return Container(
      width: Get.width,
      child: Row(
        mainAxisAlignment: isMind ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
                minWidth: Get.width*0.1,
                maxWidth: Get.width*0.7
            ),
            padding: const EdgeInsets.all(16).copyWith(top: 8,bottom: 8),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: isMind ? Colors.teal : Colors.grey.withAlpha(50),
                borderRadius: isMind ? const BorderRadius.only(bottomLeft: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10)) :
                const BorderRadius.only(bottomRight: Radius.circular(10),topLeft: Radius.circular(10),topRight: Radius.circular(10))
            ),
            child: Text(document.text!,style: TextStyle(color: isMind ? Colors.white : Colors.black),),
          ),

        ],
      ),
    );
  }
}
