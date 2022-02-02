import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text('HomeView'),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            body: Obx(() {
              return !controller.loading.value ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: controller.allContacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(10).copyWith(bottom: 0),
                    child: ListTile(
                      onTap: () => Get.toNamed(Routes.CHATPAGE,arguments: controller.allContacts[index]),
                      title: Text(controller.allContacts[index].other!.name!),
                      subtitle: Text(controller.allContacts[index].other!.email!),
                      leading: ClipOval(child: Image.network(controller.allContacts[index].other!.photo!,height: 50,width: 50,)),
                    ),
                  );
                }
              ) : const Center(child: CircularProgressIndicator());
            }),
          );
        }
    );
  }
}
