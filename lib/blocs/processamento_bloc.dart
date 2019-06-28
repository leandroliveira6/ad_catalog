import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class ProcessamentoBloc extends BlocBase {
  final _processamentoController = StreamController<String>.broadcast();
  String _estadoCorrente = 'pronto';

  Stream get obterEstadoFuturo => _processamentoController.stream;
  String get obterEstado => _estadoCorrente;

  ProcessamentoBloc() {
    print('Instancia de ProcessamentoBloc criada');
  }

  void atualizarEstadoPara(novoEstado){
    _estadoCorrente = novoEstado;
    _processamentoController.sink.add(_estadoCorrente);
  }

  @override
  void dispose() {
    _processamentoController.close();
    super.dispose();
  }
}
