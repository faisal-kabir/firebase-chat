class User {
  User({
      this.name, 
      this.docId, 
      this.email, 
      this.photo,});

  User.fromJson(dynamic json) {
    name = json['name'];
    docId = json['doc_id'];
    email = json['email'];
    photo = json['photo'];
  }
  String? name;
  String? docId;
  String? email;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['doc_id'] = docId;
    map['email'] = email;
    map['photo'] = photo;
    return map;
  }

}