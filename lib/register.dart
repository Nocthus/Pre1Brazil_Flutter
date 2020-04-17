import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pre1brazil/home.dart';



class RegisterAPage extends StatefulWidget {
  RegisterAPage({Key key}) : super(key: key);

  @override
  _RegisterAPageState createState() => _RegisterAPageState();
}

class _RegisterAPageState extends State<RegisterAPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController nameInputController;
  TextEditingController emailInputController;
  TextEditingController cpfInputController;
  TextEditingController crmInputController;
  TextEditingController ufInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;

  @override
  initState() {
    nameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    cpfInputController = new TextEditingController();
    crmInputController = new TextEditingController();
    ufInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Form(
              key: _registerFormKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Nome completo*', hintText: "John"),
                    controller: nameInputController,
                    validator: (value) {
                      if (value.length < 3) {
                        return "Por favor inserir o nome completo.";
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email*', hintText: "john.doe@gmail.com"),
                    controller: emailInputController,
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: 'CPF(somente numeros)*', hintText: "99999999999"),
                      controller: cpfInputController,
                      validator: (value) {
                        if (value.length < 11) {
                          return "Por favor inserir um CPF válido.";
                        }
                      }
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: 'CRM*', hintText: "895"),
                      controller: crmInputController,
                      validator: (value) {
                        if (value.length < 4) {
                          return "Por favor inserir o CRM correto.";
                        }
                      }
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                          labelText: 'UF*', hintText: "CE"),
                      controller: ufInputController,
                      validator: (value) {
                        if (value.length < 2) {
                          return "Por favor inserir o UF correto.";
                        }
                      }
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Senha*', hintText: "********"),
                    controller: pwdInputController,
                    obscureText: true,
                    validator: pwdValidator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Confirmar Senha*', hintText: "********"),
                    controller: confirmPwdInputController,
                    obscureText: true,
                    validator: pwdValidator,
                  ),
                  RaisedButton(
                    child: Text("Registrar"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_registerFormKey.currentState.validate()) {
                        if (pwdInputController.text ==
                            confirmPwdInputController.text) {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailInputController.text,
                                  password: pwdInputController.text)
                              .then((currentUser) => Firestore.instance
                                  .collection("usuarios")
                                  .document(currentUser.uid)
                                  .setData({
                                    "uid": currentUser.uid,
                                    "nome_completo": nameInputController.text,
                                    "cpf": cpfInputController.text,
                                    "crm": crmInputController.text,
                                    "uf": ufInputController.text,
                                    "email": emailInputController.text,
                                  })
                                  .then((result) => {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                      uid: currentUser.uid,
                                                )),
                                            (_) => false),
                                        nameInputController.clear(),
                                        emailInputController.clear(),
                                        cpfInputController.clear(),
                                        crmInputController.clear(),
                                        ufInputController.clear(),
                                        pwdInputController.clear(),
                                        confirmPwdInputController.clear()
                                      })
                                  .catchError((err) => print(err)))
                              .catchError((err) => print(err));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text("As senhas estao diferêntes, digite novamente!"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Fechar"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      }
                    },
                  ),
                  Text("Já tem uma conta??"),
                  FlatButton(
                    child: Text("Faça seu login!"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ))));
  }
}
