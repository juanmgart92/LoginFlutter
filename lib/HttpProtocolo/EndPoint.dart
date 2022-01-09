import 'package:flutter_login_/Common/Constant.dart';
import 'package:flutter_login_/HttpProtocolo/HttpExecute.dart';
import 'package:flutter_login_/Model/Count.dart';

class EndPoint {
  static login(String email, String password) {
    Map parameters = {
      GRANT_TYPE: "password",
      USERNAME: email,
      PASSWORD: password,
      AUDIENCE: URL + API,
      SCOPE: "openid",
      CLIENT_ID: APP_ID,
      CLIENT_SECRET: APP_SECRET
    };

    return HttpExecute(endpoint: "/oauth/token", parameters: parameters).post();
  }

  static getUser(Count count) {
    return HttpExecute(endpoint: "/userinfo", count: count).get();
  }
}
