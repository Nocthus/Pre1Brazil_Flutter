import 'package:mobx/mobx.dart';
part 'login_model.g.dart';

class LoginModel = _LoginModelBase with _$LoginModel;

abstract class _LoginModelBase with Store {

  @observable
  String name;
  @action
  changeName(String value) => name = value;

  @observable
  String email;
  @action
  changeEmail(String value) => email = value;

  @observable
  String cpf;
  @action
  changeCpf(String value) => cpf = value; 
}
