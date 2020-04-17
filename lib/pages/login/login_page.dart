import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pre1brazil/common_components/text_field.dart';
import 'package:pre1brazil/controllers/loigin_controller.dart';

class LoginUPage extends StatelessWidget {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MobX"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(builder: (_) {
                return CustomTextField(
                    errorText: controller.validateName,
                    labelText: "Name",
                    onChanged: controller.login.changeName);
              }),
              SizedBox(height: 20),
              Observer(builder: (_) {
                return CustomTextField(
                    errorText: controller.validateEmail,
                    labelText: "E-mail",
                    onChanged: controller.login.changeEmail);
              }),
              SizedBox(height: 20),
              Observer(builder: (_) {
                return CustomTextField(
                    errorText: controller.validateCpf,
                    labelText: "CPF",
                    onChanged: controller.login.changeCpf);
              }),
              SizedBox(height: 20),
              Observer(builder: (_) {
                return RaisedButton(
                  onPressed: controller.isValid ? () {} : null,
                  child: Text("Salvar"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
