import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class SidebarBloc extends BlocBase{

  final _sidebarController = StreamController<bool>.broadcast();
  bool _detalhesDoUsuario = false;

  Stream get detalhesUsuarioAtivo => _sidebarController.stream;

  SidebarBloc(){
    print('Instancia de SidebarBloc criada');
  }

  void trocarCorpo() {
    _detalhesDoUsuario = !_detalhesDoUsuario;
    _sidebarController.sink.add(_detalhesDoUsuario);
  }

  @override
  void dispose(){
    _sidebarController.close();
    super.dispose();
  }
}