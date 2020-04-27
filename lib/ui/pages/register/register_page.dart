import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pre1brazil/core/controllers/register_controller.dart';
import 'package:pre1brazil/ui/common_components/text_form_field.dart';
import 'package:pre1brazil/ui/home.dart';


class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = RegisterController();
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final TextEditingController nameInputController = TextEditingController();
  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController senhaInputController = TextEditingController();

  String validateSenha(String value) {
    if (value == null) {
      return 'Este campo é obrigatório';
    } else if (value.length < 6) {
      return 'Esse não é uma SENHA valido!';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _registerFormKey,
              child: Column(
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      return CustomTextFormField(
                          labelText: 'Nome',
                          controller: nameInputController,
                          validator: (value) {
                            if (value.length < 3) {
                              return "Por favor inserir um CPF válido.";
                            }
                          });
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return CustomTextFormField(
                        labelText: 'email',
                        controller: emailInputController,
                        validator: (value) {
                          if (value.length < 3) {
                            return "Por favor inserir um CPF válido.";
                          }
                        },
                      );
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return CustomTextFormField(
                        labelText: 'Senha',
                        controller: senhaInputController,
                        validator: validateSenha,
                      );
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return CustomTextFormField(
                          labelText: 'Nome',
                          controller: nameInputController,
                          validator: (value) {
                            if (value.length < 3) {
                              return "Por favor inserir um CPF válido.";
                            }
                          });
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return CustomTextFormField(
                          labelText: 'Nome',
                          controller: nameInputController,
                          validator: (value) {
                            if (value.length < 3) {
                              return "Por favor inserir um CPF válido.";
                            }
                          });
                    },
                  ),
                  Observer(
                    builder: (_) {
                      return CustomTextFormField(
                          labelText: 'Nome',
                          controller: nameInputController,
                          validator: (value) {
                            if (value.length < 3) {
                              return "Por favor inserir um CPF válido.";
                            }
                          });
                    },
                  ),
                  RaisedButton(
                    child: Text("Register"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_registerFormKey.currentState.validate()) {
                        // if (senhaInputController.text ==
                        //     confirmPwdInputController.text) {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailInputController.text,
                                password: senhaInputController.text)
                            .then((currentUser) => Firestore.instance
                                .collection("usuarios")
                                .document(currentUser.uid)
                                .setData({
                                  "uid": currentUser.uid,
                                  "nome": nameInputController.text,
                                  "email": emailInputController.text,
                                })
                                .then((result) => {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => HomePage(
                                                    title: 'ovos',
                                                    uid: currentUser.uid,
                                                  )),
                                          (_) => false),
                                      nameInputController.clear(),
                                      emailInputController.clear(),
                                      senhaInputController.clear(),
                                    })
                                .catchError((err) => print(err)))
                            .catchError((err) => print(err));
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text("The passwords do not match"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Close"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      }
                      //}
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
