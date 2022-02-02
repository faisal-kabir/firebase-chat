import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat/app/data/messages.dart';
import 'package:firebase_chat/app/data/user.dart';

import '../../main.dart';

class FireDatabase {
  CollectionReference? fireStore;
  CollectionReference? users;

  FireDatabase(){
    users=FirebaseFirestore.instance.collection("users");
    fireStore=FirebaseFirestore.instance.collection("chats");
  }

  Stream getUsers(){
    return users!.get().asStream();
  }

  Future login(String email) async {
    return await users!.where("email",isEqualTo: email).get();
  }

  Future register(Map data) async {
    return await users!.add(data);
  }


  Future getUser(String id) async {
    return await users!.doc(id).get();
  }



  Future<List<Messages>> getContacts() async{
    List<Messages> contacts=[];
    await fireStore!.where('users',arrayContains: user!.docId).get().then((value) async{
      for (var element in value.docs) {
        Messages single = Messages.fromJson(element.data());
        var us = await users!.doc(single.users![(1-single.users!.indexOf(user!.docId!))]).get();
        User temp = User.fromJson(us.data());
        temp.docId = us.id;
        single.other = temp;
        single.docId=element.id;
        contacts.add(single);
      }
    });
    return contacts;
  }
  Future<List<MessagesData>> getSpecificContacts(String docId) async{
    List<MessagesData> mes=[];
    await fireStore!.doc(docId).get().then((value) async{
      Messages single = Messages.fromJson(value.data());
      mes.addAll(single.messages!);
    });
    return mes;
  }
  Stream<Messages>getChats(String? docId){
    return fireStore!.doc(docId).snapshots().map((event) => Messages.fromJson(event.data()));
  }

  void addMessage(Messages? data) {
    fireStore!.doc(data!.docId).
    set({
      "messages": data.messages!.map((v) => v.toJson()).toList()
    },SetOptions(merge: true));
  }


}