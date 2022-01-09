import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_login_/Common/TransitionApp.dart';
import 'package:flutter_login_/Widgets/BarGradient.dart';
import 'package:flutter_login_/Widgets/ButtonBase.dart';
import 'package:flutter_login_/Widgets/TextFieldBase.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlUser = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            BarGradient("Crear Cuenta", Icons.person_add_alt_1_sharp),
            TextFieldBase("Nombre", ctrlName),
            TextFieldBase("Usuario", ctrlUser),
            TextFieldBase("Correo", ctrlEmail),
            TextFieldBase("Contraseña", ctrlPass),
            ButtonBase("Crear Cuenta", () => signUp()),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("¿Tienes una cuenta?"),
                  Text(
                    "Iniciar Sesión",
                    style: TextStyle(color: Colors.red[400]),
                  )
                ],
              ),
              onTap: () => TransitionApp.closePageOrDialog(context),
            )
          ],
        ),
      ),
    ));
  }

  signUp() {}
}
