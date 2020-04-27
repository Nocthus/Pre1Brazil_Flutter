import 'package:mobx/mobx.dart';
import 'package:pre1brazil/core/models/login_model.dart';
part 'loigin_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  var login = LoginModel();

  @computed
  bool get isValid {
    return validateName() == null &&
        validateEmail() == null &&
        validateCpf() == null;
  }

  String validateName() {
    if (login.name == null || login.name.isEmpty) {
      return "Este campo é obrigatório!";
    } else if (login.name.length < 3) {
      return "Seu nome precisa ter mais de 3 caracters!";
    }
    return null;
  }

  String validateEmail() {
    // final bool isValid = EmailValidator.validate(login.email);
    if (login.email == null || login.email.isEmpty) {
      return "Este campo é obrigatório";
    } else if (!login.email.contains("@")) {
      return "Esse não é um email valido!";
    }
    return null;
  }

  String validateCpf() {
    if (login.cpf == null || login.cpf.isEmpty) {
      return "Este campo é obrigatório";
    }
    return null;
  }
}
