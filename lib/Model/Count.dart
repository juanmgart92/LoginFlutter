import 'package:flutter_login_/Common/Validate.dart';
import 'package:flutter_login_/HttpProtocolo/EndPoint.dart';

class Count {
  int id;
  String refreshToke;
  String accessToken;
  String createdAd;
  String expireIn;
  String expireTime;
  String tokenType;

  Count(
      {this.id = 0,
      this.refreshToke = "",
      this.accessToken = "",
      this.createdAd = "",
      this.expireIn = "",
      this.expireTime = "",
      this.tokenType = ""});

  factory Count.toObject(Map<String, Object?> data) {
    Validate validate = Validate(data);
    return Count(
      id: validate.chekKeyExist(key: "id", initialize: 0),
      accessToken: validate.chekKeyExist(key: "access_token", initialize: ""),
      refreshToke: validate.chekKeyExist(key: "refresh_token", initialize: ""),
      createdAd: validate.chekKeyExist(key: "created_at", initialize: ""),
      expireIn: validate.chekKeyExist(key: "expire_in", initialize: ""),
      expireTime: validate.chekKeyExist(key: "expire_time", initialize: ""),
      tokenType: validate.chekKeyExist(key: "token_type", initialize: ""),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'access_token': this.accessToken,
      'refresh_token': this.refreshToke,
      'created_at': this.createdAd,
      'expire_in': this.expireIn,
      'expire_time': this.expireTime,
      'token_type': this.tokenType
    };
  }

  login(String email, String password) async {
    var data = await EndPoint.login(email, password);
    print("respuesta $data");
    return Validate(data).checkIsStatusOrResponse(saveOrUpdate);
  }

  saveOrUpdate(data) {
    return Count.toObject(data);
  }
}
