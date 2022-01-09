import 'dart:convert';

import 'package:flutter_login_/HttpProtocolo/HttpExecute.dart';
import 'package:flutter_login_/HttpProtocolo/Status.dart';

class Validate {
  var data;
  Validate(this.data);

  chekKeyExist({String key = "", var initialize}) {
    return (data.containsKey(key) && data[key] != null)
        ? data[key]
        : initialize;
  }

  checkIsStatusOrResponse(VoidCallbackParam method) {
    return (data is Status) ? data : method(json.decode(data));
  }
}
