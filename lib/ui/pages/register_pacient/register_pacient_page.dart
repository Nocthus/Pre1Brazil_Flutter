import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pre1brazil/core/controllers/loigin_controller.dart';
import 'package:pre1brazil/ui/common_components/text_field.dart';
import 'package:pre1brazil/ui/home.dart';


class RegisterUpacientPage extends StatelessWidget {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registrar"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Form(
              child: Column(
                children: <Widget>[
                  Observer(builder: (_) {
                    return CustomTextField(
                        errorText: controller.validateName,
                        labelText: "Name",
                        onChanged: controller.login.changeName);
                  }),
                  Observer(builder: (_) {
                    return CustomTextField(
                        errorText: controller.validateName,
                        labelText: "CPF(somente numeros)*",
                        onChanged: controller.login.changeName);
                  }),
                  Text("Glicemia de Jejum:(mg/dl)"),
                  Observer(builder: (_) {
                    return CustomTextField(
                        errorText: controller.validateName,
                        labelText: "Primeiro Exame*",
                        onChanged: controller.login.changeName);
                  }),
                  Observer(builder: (_) {
                    return CustomTextField(
                        errorText: controller.validateName,
                        labelText: "Segundo Exame*",
                        onChanged: controller.login.changeName);
                  }),
                  Observer(builder: (_) {
                    return CustomTextField(
                        errorText: controller.validateName,
                        labelText: "Primeira alteração glicemica*",
                        onChanged: controller.login.changeName);
                  }),
                  Text(
                      "Hemoglibina Glicada(%) por método HPLC ou imunoturbidimetria:"),
                  Observer(builder: (_) {
                    return CustomTextField(
                        errorText: controller.validateName,
                        labelText: "Primeiro Exame*",
                        onChanged: controller.login.changeName);
                  }),
                  Observer(builder: (_) {
                    return CustomTextField(
                        errorText: controller.validateName,
                        labelText: "Segundo Exame*",
                        onChanged: controller.login.changeName);
                  }),
                  Text("Presença de auto-anticorpos:"),
                  Observer(builder: (_) {
                    return CustomTextField(
                        errorText: controller.validateName,
                        labelText: "Primeiro Exame*",
                        onChanged: controller.login.changeName);
                  }),
                  Observer(builder: (_) {
                    return CustomTextField(
                        errorText: controller.validateName,
                        labelText: "Primeiro Exame*",
                        onChanged: controller.login.changeName);
                  }),
                  Observer(builder: (_) {
                    return CustomTextField(
                        errorText: controller.validateName,
                        labelText: "Primeiro Exame*",
                        onChanged: controller.login.changeName);
                  }),
                  Observer(builder: (_) {
                    return CustomTextField(
                        errorText: controller.validateName,
                        labelText: "Primeiro Exame*",
                        onChanged: controller.login.changeName);
                  }),
                  Observer(builder: (_) {
                    return CustomTextField(
                        errorText: controller.validateName,
                        labelText: "Primeiro Exame*",
                        onChanged: controller.login.changeName);
                  }),
                  RaisedButton(
                    child: Text("Registrar"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                ],
              ),
            ))));
  }
}
