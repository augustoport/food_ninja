import 'package:flutter/material.dart';
import 'package:food_ninja/core/bloc/app_event.dart';
import 'package:food_ninja/core/bloc/base_bloc.dart';
import 'package:food_ninja/locator.dart';

class LoginBloc extends BaseBloc {
  login(String email, String password, context) {
    if (email == "augustoportella@aluno.ifsp.edu.br" && password == "123456") {
      eventBus.fire(AppLoginIn());
    } else {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Atenção'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('Usuário e/ou Senha inválidos'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
