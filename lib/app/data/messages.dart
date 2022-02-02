import 'dart:convert';

import 'package:firebase_chat/app/data/user.dart';

class Messages {
  Messages({
      this.users,
      this.messages,this.other,this.docId});

  Messages.fromJson(dynamic json) {
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users?.add(v);
      });
    }
    if (json['messages'] != null) {
      messages = [];
      json['messages'].forEach((v) {
        messages?.add(MessagesData.fromJson(v));
      });
    }
  }
  List<String>? users;
  List<MessagesData>? messages;
  User? other;
  String? docId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['users'] = users;
    map['doc_id'] = docId;
    if (messages != null) {
      map['messages'] = messages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class MessagesData {
  MessagesData({
      this.isRead, 
      this.sender, 
      this.time, 
      this.text,});

  MessagesData.fromJson(dynamic json) {
    isRead = json['is_read'];
    sender = json['sender'];
    time = json['time'];
    text = json['text'];
  }
  bool? isRead;
  String? sender;
  String? time;
  String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_read'] = isRead;
    map['sender'] = sender;
    map['time'] = time;
    map['text'] = text;
    return map;
  }

}