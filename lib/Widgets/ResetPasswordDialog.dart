import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_/Common/TransitionApp.dart';
import 'package:flutter_login_/Widgets/ButtonBase.dart';
import 'package:flutter_login_/Widgets/TextFieldBase.dart';

class ResetPasswordDialog extends StatelessWidget {
  TextEditingController ctrlEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldBase("Correo", ctrlEmail),
            Row(
              children: [
                ButtonBase("Cancelar", () => close(context)),
                ButtonBase("Restablecer", () => reset()),
              ],
            )
          ],
        ),
      ),
    );
  }

  close(BuildContext context) {
    TransitionApp.closePageOrDialog(context);
  }

  reset() {}
}
