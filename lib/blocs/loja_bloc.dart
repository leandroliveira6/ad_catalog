import 'dart:async';

import 'package:ad_catalog/models/loja.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class LojaBloc extends BlocBase{

  final _lojaController = StreamController<Loja>();
  final _filtroController = StreamController<int>();

  final _lojas = [
    Loja(id: 1, nome: 'Loja 1', telefones: ['1111-1111', '1111-2222'], enderecos: ['Endereço 11', 'Endereço 12']),
    Loja(id: 2, nome: 'Loja 2', telefones: ['2222-1111', '2222-2222'], enderecos: ['Endereço 21', 'Endereço 22']),
    Loja(id: 3, nome: 'Loja 3', telefones: ['3333-1111', '3333-2222'], enderecos: ['Endereço 31', 'Endereço 32']),
  ];

  LojaBloc(){
    print('Instancia de LojaBloc criada');
    _filtroController.stream.listen(consultarLoja);
  }

  consultarLoja(idLoja) {
    print(idLoja);
    _lojaController.sink.add(_lojas[idLoja-1]);
  }

  Stream get obterLoja => _lojaController.stream;
  Sink get especificarLoja => _filtroController.sink;

  @override
  void dispose(){
    _lojaController.close();
    _filtroController.close();
    super.dispose();
  }
}