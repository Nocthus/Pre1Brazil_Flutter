// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterModel on _RegisterModelBase, Store {
  final _$nomeAtom = Atom(name: '_RegisterModelBase.nome');

  @override
  String get nome {
    _$nomeAtom.context.enforceReadPolicy(_$nomeAtom);
    _$nomeAtom.reportObserved();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.context.conditionallyRunInAction(() {
      super.nome = value;
      _$nomeAtom.reportChanged();
    }, _$nomeAtom, name: '${_$nomeAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_RegisterModelBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$senhaAtom = Atom(name: '_RegisterModelBase.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$_RegisterModelBaseActionController =
      ActionController(name: '_RegisterModelBase');

  @override
  void changeEmail(String value) {
    final _$actionInfo = _$_RegisterModelBaseActionController.startAction();
    try {
      return super.changeEmail(value);
    } finally {
      _$_RegisterModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSenha(String value) {
    final _$actionInfo = _$_RegisterModelBaseActionController.startAction();
    try {
      return super.changeSenha(value);
    } finally {
      _$_RegisterModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeConfirmarSenha(String value) {
    final _$actionInfo = _$_RegisterModelBaseActionController.startAction();
    try {
      return super.changeConfirmarSenha(value);
    } finally {
      _$_RegisterModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'nome: ${nome.toString()},email: ${email.toString()},senha: ${senha.toString()}';
    return '{$string}';
  }
}
