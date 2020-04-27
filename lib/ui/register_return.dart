import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pre1brazil/ui/home.dart';

class RegisterreturnPage extends StatefulWidget {
  RegisterreturnPage({Key key}) : super(key: key);

  @override
  _RegisterreturnPageState createState() => _RegisterreturnPageState();
}

class _RegisterreturnPageState extends State<RegisterreturnPage> {
  final GlobalKey<FormState> _registerpacientFormKey = GlobalKey<FormState>();
  TextEditingController numerodavisitaInputController;
  TextEditingController medicacaoInputController;
  TextEditingController atividadeInputController;
  TextEditingController pesoInputController;
  TextEditingController pasInputController;
  TextEditingController padInputController;
  TextEditingController circunferenciaabdominalInputController;
  TextEditingController infeccaoInputController;
  TextEditingController intercorrenciasInputController;
  TextEditingController glicemiaInputController;
  TextEditingController a1cInputController;
  TextEditingController perfillipidicoInputController;
  TextEditingController peptideobasalInputController;
  TextEditingController insulinabasalInputController;
  TextEditingController homabInputController;
  TextEditingController homairInputController;
  TextEditingController tshInputController;
  TextEditingController creatininaInputController;
  TextEditingController ohvidInputController;
  TextEditingController antitpoInputController;
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
    numerodavisitaInputController = new TextEditingController();
    medicacaoInputController = new TextEditingController();
    atividadeInputController = new TextEditingController();
    pesoInputController = new TextEditingController();
    pasInputController = new TextEditingController();
    padInputController = new TextEditingController();
    circunferenciaabdominalInputController = new TextEditingController();
    infeccaoInputController = new TextEditingController();
    intercorrenciasInputController = new TextEditingController();
    glicemiaInputController = new TextEditingController();
    a1cInputController = new TextEditingController();
    perfillipidicoInputController = new TextEditingController();
    peptideobasalInputController = new TextEditingController();
    insulinabasalInputController = new TextEditingController();
    homabInputController = new TextEditingController();
    homairInputController = new TextEditingController();
    tshInputController = new TextEditingController();
    creatininaInputController = new TextEditingController();
    ohvidInputController = new TextEditingController();
    antitpoInputController = new TextEditingController();
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
                        InputDecoration(labelText: 'Numero da visita:'),
                        controller: numerodavisitaInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Medicação em uso:'),
                        controller: medicacaoInputController,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Se sim qual?', hintText: ""),
                        controller: atividadeInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Peso', hintText: ""),
                        controller: pesoInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'PAs', hintText: ""),
                        controller: pasInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'PAd',
                        hintText: ""),
                        controller: padInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Circunferência abdominal(linha média entre arco-costal e crista ilíaca antero-superior)', hintText: ""),
                        controller: circunferenciaabdominalInputController,
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
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Se sim, qual?', hintText: ""),
                        controller: infeccaoInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Intercorrências nos últimos 3 meses', hintText: ""),
                        controller: intercorrenciasInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Glicemia de jejum', hintText: ""),
                        controller:  glicemiaInputController,
                  ),
                  
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'A1C(HPLC ou imunoturbidimetria)', hintText: ""),
                        controller: a1cInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Perfil lipídico', hintText: ""),
                        controller:  perfillipidicoInputController,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Peptídeo-C basal', hintText: ""),
                        controller: peptideobasalInputController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Insulina basal', hintText: ""),
                        controller: insulinabasalInputController,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'TSH(mU/L)', hintText: ""),
                        controller: tshInputController,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Creatinina(mg/L)', hintText: ""),
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
                    decoration:
                        InputDecoration(labelText: 'HOMA-B', hintText: ""),
                        controller: homabInputController,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'HOMA-IR', hintText: ""),
                        controller: homairInputController,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'AntiTG', hintText: ""),
                        controller: antitgInputController,
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
