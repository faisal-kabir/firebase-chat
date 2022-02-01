import 'package:cloud_firestore/cloud_firestore.dart';

class FireDatabase {
  CollectionReference? fireStore;
  CollectionReference? users;
  List<String> Months=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];

  FireDatabase(){
    users=FirebaseFirestore.instance.collection("users");
    fireStore=FirebaseFirestore.instance.collection("chats");
  }

  Stream getUsers(){
    return users!.get().asStream();
  }

  login(String email) async {
    return await users!.where("email",isEqualTo: email).get()/*.then((value) => value.docs[0].id)*/;
  }

/*  getChats(FBaseUser from,FBaseUser to) async{
    return fireStore.where('sender_id',isEqualTo: from.userID)
        .where('receiver_id',isEqualTo: to.userID)
        .get()
        .asStream();
  }
  Future checkUser(FBaseUser from, FBaseUser to) async{
    await addUser(from);
    await addUser(to);
  }

  Future addUser(FBaseUser user) async{
    print('User = ${user.toJson()}');
    await users.add(user.toJson()).catchError((e){
      print(e);
    });
    *//*return users
        .get()
        .then((value){
          value.docs.forEach((element) {print(element.data());});
          *//**//*if(value.docs.isEmpty){
            users.add(user.toJson()).catchError((error){
              print('Create User = $error');
            });
          }*//**//*
    }).catchError((error){
      print('Error = $error');
    });*//*
  }


  Future addMessage({@required String content,String created,@required String senderID,@required String receiverId})async{
    Map<String, dynamic> body={
      'message':content,
      'date_time': getDateTime(datetime: created),
      'sender_id':senderID,
      'receiver_id':receiverId,
      'read':'0',
    };
    print(body);
    *//* fireStore.add(body).catchError((e){
          print(e.toString());
    });*//*
    fireStore
        .doc(senderID)
        .collection('thread')
        .add({
      'content':content,
      'created': getDateTime(datetime: created),
      'sender_id':senderID,
      'sender_name':'test',
      //'time':DateTime.now().millisecondsSinceEpoch,
    }).catchError((e){
      print(e.toString());
    });
  }*/

  String getDateTime({String? datetime}){
    datetime ??= DateTime.now().toString();
    List<String> data=datetime.split(" ");
    List date=data[0].split("-");
    List time=data[1].split('.')[0].split(":");
    int hour=int.parse(time[0]);
    bool isPm=hour>12;
    return'${Months[int.parse(date[1])-1]} ${date[2]},${date[0]} at ${isPm ? hour-12 : hour}:${time[1]}:${time[2]} ${isPm ? 'PM' : "AM"} UTC+6';
  }


}