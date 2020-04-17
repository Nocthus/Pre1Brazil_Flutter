import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pre1brazil/home.dart';

class RegisterpacientPage extends StatefulWidget {
  RegisterpacientPage({Key key}) : super(key: key);

  @override
  _RegisterpacientPageState createState() => _RegisterpacientPageState();
}

class _RegisterpacientPageState extends State<RegisterpacientPage> {
  final GlobalKey<FormState> _registerpacientFormKey = GlobalKey<FormState>();
  bool isSwitched = true;
  List<DropdownMenuItem<int>> listDrop = [];
  List<DropdownMenuItem<String>> listDropgender = [];

  void loadData() {
    listDrop.add(new DropdownMenuItem(
      child: new Text('ng/mL'),
      value: 0,
    ));
    listDrop.add(new DropdownMenuItem(
      child: new Text('nmol/L'),
      value: 1,
    ));
    listDropgender.add(new DropdownMenuItem(
      child: new Text('feminino'),
      value: 'f',
    ));
    listDropgender.add(new DropdownMenuItem(
      child: new Text('masculino'),
      value: 'm',
    ));
  }

  @override
  initState() {
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
    loadData();
    return Scaffold(
        appBar: AppBar(
          title: Text("Registrar"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Form(
              key: _registerpacientFormKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Nome:', hintText: "John"),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'CPF(somente numeros)*',
                        hintText: "99999999999"),
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Data*', hintText: ""),
                  ),
                  DropdownButton(
                    hint: new Text('Sexo'),
                    items: listDropgender, 
                    onChanged: null,
                  ),
                  SwitchListTile(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                    title: const Text(
                        'Usa insulina ou qualquer outra terapia HIPOGLICEMIANTE para diabetes ou pré-diabetes?'),
                  ),
                  Text("Glicemia de Jejum:(mg/dl)"),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Primeiro Exame*', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Segundo Exame*', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Primeira alteração glicemica*',
                        hintText: ""),
                  ),
                  Text(
                      "Hemoglibina Glicada(%) por método HPLC ou imunoturbidimetria:"),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Primeiro Exame*', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Segundo Exame*', hintText: ""),
                  ),
                  SwitchListTile(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                    title: const Text('Usa corticoide?'),
                  ),
                  Text("Presença de auto-anticorpos:"),
                  SwitchListTile(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                    title: const Text('Anti-GAD'),
                  ),
                  SwitchListTile(
                    value: null,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                    title: const Text('Anti-ilhota pancreática'),
                  ),
                  SwitchListTile(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                    title: const Text('Anti-insulina'),
                  ),
                  SwitchListTile(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                    title: const Text('Anti-transportador de Zinco 8A'),
                  ),
                  Text(
                      "O paciente utiliza vitamina D? Se não, preencher com 0."),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Qual a dose mensal?', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Há quanto tempo?(semanas)', hintText: ""),
                  ),
                  SwitchListTile(
                    value: null,
                    onChanged: (value) {
                      setState(() {});
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                    title: const Text(
                        'Está sendo utilizada como forma de tratamento para pre-DM?'),
                  ),
                  DropdownButton(
                    hint: new Text('unidade de medida'),
                    items: listDrop, 
                    onChanged: null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Valor', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Insulina basal(mU/L)', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'TSH(mU/L)', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Creatinina(mg/L)', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: '25-OHViD(ng/ml)', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'AntiTPO(UI/ml)', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Colesterol total(mg/dL)', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'HDL(mg/dL)', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'LDL(mg/dL)', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Triglicerídeos(mg/dL)', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Perfil lipídico', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'HOMA-B', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'HOMA-IR', hintText: ""),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'AntiTG', hintText: ""),
                  ),
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
