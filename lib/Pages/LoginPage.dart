import 'dart:js';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_login_/Common/TransitionApp.dart';
import 'package:flutter_login_/Model/Count.dart';
import 'package:flutter_login_/Model/User.dart';
import 'package:flutter_login_/Pages/SignUpPage.dart';
import 'package:flutter_login_/Widgets/BarGradient.dart';
import 'package:flutter_login_/Widgets/ButtonBase.dart';
import 'package:flutter_login_/Widgets/ProgressDialog.dart';
import 'package:flutter_login_/Widgets/ResetPasswordDialog.dart';
import 'package:flutter_login_/Widgets/SnackBarApp.dart';
import 'package:flutter_login_/Widgets/TextFieldBase.dart';
import 'package:flutter_login_/Widgets/TextMessage.dart';

import 'HomePage.dart';
import 'LoadingPage.dart';

class LoginPage extends StatelessWidget {
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        BarGradient("Windows Shopper", Icons.store),
        TextFieldBase(
          "Usuario",
          ctrlEmail,
          icon: Icons.person,
        ),
        TextFieldBase(
          "Contraseña",
          ctrlPass,
          icon: Icons.remove_red_eye,
          obscureText: true,
        ),
        InkWell(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: EdgeInsets.only(right: 32, top: 16),
                child: Text(
                  "¿Olvidaste tu contraseña?",
                  style: TextStyle(color: Colors.grey),
                )),
          ),
          onTap: () => resetPassword(context),
        ),
        ButtonBase("Iniciar Sesión", () => login(context)),
        InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("¿No tienes cuenta?"),
              Text(
                " Crear cuenta",
                style: TextStyle(color: Colors.red[400]),
              )
            ],
          ),
          onTap: () => signUp(context),
        )
      ]),
    ));
  }

  login(BuildContext context) async {
    Count count = await Count().login("juanma.0627ga@gmail.com", "juan123");
    User().getUser(count);

    /*ScaffoldMessenger.of(context).showSnackBar(SnackBarApp(
        TextMessage("Usuario o contraseña incorrecta. Intente de nuevo")));*/
    //showProgress(context);
    //TransitionApp.openPage(LoadingPage(), context);
  }

  Future<void> showProgress(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return ProgressDialog();
        });
  }

  signUp(context) {
    TransitionApp.openPage(SignUpPage(), context);
  }

  Future<void> resetPassword(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return ResetPasswordDialog();
        });
  }
}
