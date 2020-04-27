import 'package:mobx/mobx.dart';
part 'register_model.g.dart';

class RegisterModel = _RegisterModelBase with _$RegisterModel;

abstract class _RegisterModelBase with Store {
 
  @observable
  String nome;
  @action
  void changeEmail(String value) => nome = value;

  @observable
  String email;
  @action
  void changeSenha(String value) => email = value;

  @observable
  String senha;
  @action
  void changeConfirmarSenha(String value) => senha = value;

}
