import 'package:mobx/mobx.dart';
import 'package:pre1brazil/models/register_model.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final register = RegisterModel();

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (register.email == null) {
      return 'Este campo é obrigatório';
    } else if (!regex.hasMatch(value)) {
      return 'Esse não é um email valido!';
    }
    return null;
  }

  String validateNome(String value) {
    if (register.nome == null) {
      return 'Este campo é obrigatório';
    } else if (register.nome.length < 3) {
      return 'Esse não é um nome valido!';
    }
    return null;
  }

  String validateSenha(String value) {
    if (register.senha == null) {
      return 'Este campo é obrigatório';
    } else if (register.senha.length < 6) {
      return 'Esse não é um nome valido!';
    }
    return null;
  }

}
