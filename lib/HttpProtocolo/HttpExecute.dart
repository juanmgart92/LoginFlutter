import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_/Common/Constant.dart';
import 'package:flutter_login_/Model/Count.dart';
import 'package:flutter_login_/Widgets/TextMessage.dart';
import 'package:http/http.dart';

import 'Status.dart';

typedef VoidCallbackParam(var param);

class HttpExecute {
  String endpoint;
  var parameters;
  Count? count;
  HttpExecute({this.endpoint = "", this.parameters, this.count});

  post() async {
    return await checkConnectivity(executeMethod, "get");
  }

  get() async {
    return await checkConnectivity(executeMethod, "post");
  }

  checkConnectivity(VoidCallbackParam voidCallbackParam, String type) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return (connectivityResult == ConnectivityResult.wifi ||
            connectivityResult == ConnectivityResult.mobile)
        ? await voidCallbackParam(type)
        : Status(
            type: CONECTION_DISABLE, statusWidget: TextMessage("Sin Conexión"));
  }

  executeMethod(var type) async {
    Response? response;
    switch (type) {
      case "post":
        response =
            await Client().post(uri, headers: header, body: this.parameters);

        break;
      case "get":
        response = await Client().get(uri, headers: header);
        print("respuesta ${response.body}");
    }

    return validateResponse(response);
  }

  validateResponse(Response? response) {
    return (response!.statusCode >= 200 && response.statusCode < 300)
        ? response.body
        : Status(
            type: SERVER_ERROR,
            response: response,
            statusWidget: TextMessage(
                "Error en el servidor" + response.statusCode.toString()));
  }

  get uri {
    return Uri.parse(URL + this.endpoint);
  }

  Map<String, String>? get header {
    return {
      "content-type": "application/x-www-form-urlencoded",
      "Authorization": (count != null) ? authorization : "null"
    };
  }

  get authorization {
    return "${count!.tokenType} ${count!.accessToken}";
  }
}
