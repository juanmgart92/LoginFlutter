import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: SimpleDialog(
          children: [
            Center(
              child: Column(children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
                Text(
                  "Por favor espere...",
                  style: TextStyle(color: Colors.red),
                )
              ]),
            )
          ],
        ),
        onWillPop: () async => true);
  }
}
