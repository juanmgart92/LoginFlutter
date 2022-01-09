import 'package:flutter_login_/Common/Validate.dart';
import 'package:flutter_login_/HttpProtocolo/EndPoint.dart';
import 'package:flutter_login_/Model/Count.dart';

class User {
  int id;
  String userName;
  String name;
  String email;

  User({this.id = 0, this.userName = "", this.name = "", this.email = ""});

  factory User.toObject(Map<String, Object?> data) {
    Validate validate = Validate(data);
    return User(
      id: validate.chekKeyExist(key: "id", initialize: 0),
      userName: validate.chekKeyExist(key: "userName", initialize: ""),
      name: validate.chekKeyExist(key: "name", initialize: ""),
      email: validate.chekKeyExist(key: "email", initialize: ""),
    );
  }

  Map<String, dynamic> toMap() {
    return {'userName': this.userName, 'name': this.name, 'email': this.email};
  }

  getUser(Count count) async {
    var data = await EndPoint.getUser(count);
    print("respuesta $data");
    return Validate(data).checkIsStatusOrResponse(saveOrUpdate);
  }

  saveOrUpdate(data) {}
}
