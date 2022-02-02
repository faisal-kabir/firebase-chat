import 'package:firebase_chat/app/data/messages.dart';
import 'package:firebase_chat/app/helper/firebase_database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FireDatabase fireDatabase=FireDatabase();
  List<Messages> allContacts=[];

  RxBool loading=true.obs;

  @override
  void onInit() {
    super.onInit();
    getAllContacts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getAllContacts() async {
    loading(true);
    allContacts = await fireDatabase.getContacts();
    loading(false);
  }
}
