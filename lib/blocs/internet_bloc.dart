import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/services.dart';

class InternetBloc extends BlocBase {
  final _internetController = StreamController<String>.broadcast();
  final _mc = MethodChannel('estadoDaInternet');
  
  Stream get estadoInternet => _internetController.stream;

  InternetBloc() {
    print('Instancia de InternetBloc criada');
    _mc.setMethodCallHandler(_atualizarEstadoInternet);
    _mc.invokeMethod('obter');
  }

  Future _atualizarEstadoInternet(MethodCall mensagem) async {
    _internetController.sink.add(mensagem.arguments);
  }

  @override
  void dispose() {
    _internetController.close();
    super.dispose();
  }
}