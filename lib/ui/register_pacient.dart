import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pre1brazil/ui/home.dart';

class RegisterpacientPage extends StatefulWidget {
  RegisterpacientPage({Key key}) : super(key: key);

  @override
  _RegisterpacientPageState createState() => _RegisterpacientPageState();
}

class _RegisterpacientPageState extends State<RegisterpacientPage> {
  final GlobalKey<FormState> _registerpacientFormKey = GlobalKey<FormState>();
  TextEditingController nameInputController;
  TextEditingController cpfInputController;
  TextEditingController glicemia1exameInputController;
  TextEditingController glicemia2exameInputController;
  TextEditingController hemoglibina1exameInputController;
  TextEditingController hemoglibina2exameInputController;
  TextEditingController vitaminaddoseInputController;
  TextEditingController vitaminadtempoInputController;
  TextEditingController peptideovalorInputController;
  TextEditingController insulinabasalInputController;
  TextEditingController tshInputController;
  TextEditingController creatininaInputController;
  TextEditingController ohvidInputController;
  TextEditingController antitpoInputController;
  TextEditingController colesteroltotalInputController;
  TextEditingController hdlInputController;
  TextEditingController ldlInputController;
  TextEditingController triglicerideosInputController;
  TextEditingController perfillipidicoInputController;
  TextEditingController homabInputController;
  TextEditingController homairInputController;
  TextEditingController antitgInputController;

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
    nameInputController = new TextEditingController();
    cpfInputController = new TextEditingController();
    glicemia1exameInputController = new TextEditingController();
    glicemia2exameInputController = new TextEditingController();
    hemoglibina1exameInputController = new TextEditingController();
    hemoglibina2exameInputController = new TextEditingController();
    vitaminaddoseInputController = new TextEditingController();
    vitaminadtempoInputController = new TextEditingController();
    peptideovalorInputController = new TextEditingController();
    insulinabasalInputController = new TextEditingController();
    tshInputController = new TextEditingController();
    creatininaInputController = new TextEditingController();
    ohvidInputController = new TextEditingController();
    antitpoInputController = new TextEditingController();
    colesteroltotalInputController = new TextEditingController();
    hdlInputController = new TextEditingController();
    ldlInputController = new TextEditingController();
    triglicerideosInputController = new TextEditingController();
    perfillipidicoInputController = new TextEditingController();
    homabInputController = new TextEditingController();
    homairInputController = new TextEditingController();
    antitgInputController = new TextEditingController();
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

  String teste(){}

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
                        controller: nameInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'CPF(somente numeros)*',
                        hintText: "99999999999"),
                        controller: cpfInputController,
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
                        controller: glicemia1exameInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Segundo Exame*', hintText: ""),
                        controller: glicemia2exameInputController,
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
                        controller: hemoglibina1exameInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Segundo Exame*', hintText: ""),
                        controller: hemoglibina2exameInputController,
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
                        controller: vitaminaddoseInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Há quanto tempo?(semanas)', hintText: ""),
                        controller: vitaminadtempoInputController,
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
                        controller: peptideovalorInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Insulina basal(mU/L)', hintText: ""),
                        controller: insulinabasalInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'TSH(mU/L)', hintText: ""),
                        controller: tshInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Creatinina(mg/L)', hintText: ""),
                        controller: creatininaInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: '25-OHViD(ng/ml)', hintText: ""),
                        controller: ohvidInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'AntiTPO(UI/ml)', hintText: ""),
                        controller: antitpoInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Colesterol total(mg/dL)', hintText: ""),
                        controller: colesteroltotalInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'HDL(mg/dL)', hintText: ""),
                        controller: hdlInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'LDL(mg/dL)', hintText: ""),
                        controller: ldlInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Triglicerídeos(mg/dL)', hintText: ""),
                        controller: triglicerideosInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Perfil lipídico', hintText: ""),
                        controller: perfillipidicoInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'HOMA-B', hintText: ""),
                        controller: homabInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'HOMA-IR', hintText: ""),
                        controller: homairInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'AntiTG', hintText: ""),
                        controller: antitpoInputController,
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
