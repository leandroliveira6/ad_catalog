import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class LocalizationsBloc extends BlocBase {
  final _idiomaController = StreamController<String>.broadcast();
  final _listaIdiomas = ['pt', 'en', 'es'];
  
  Map<String, Map<String, String>> localizedValues;

  get obterIdioma => _idiomaController.stream;
  List<String> get obterIdiomas => _listaIdiomas;

  LocalizationsBloc() {
    print('Instancia de LocalizationsBloc criada');
    //_carregarValores();
  }

  void alterarIdiomaPara(novoIdioma){
    _idiomaController.sink.add(novoIdioma);
  }

  @override
  void dispose() {
    _idiomaController.close();
    super.dispose();
  }
}
