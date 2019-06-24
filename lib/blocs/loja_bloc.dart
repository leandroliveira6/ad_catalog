import 'dart:async';

import 'package:ad_catalog/models/loja.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class LojaBloc extends BlocBase{

  final _lojaController = StreamController<Loja>.broadcast();
  final _filtroController = StreamController<int>();

  // LISTA PARA DEBUG
  final _lojas = [
    Loja(id: 1, nome: 'Loja 1', telefones: ['1111-1111', '1111-2222'], enderecos: ['Endereco 11', 'Endereco 12'], descricao: 'Descricao 1'),
    Loja(id: 2, nome: 'Loja 2', telefones: ['2222-1111', '2222-2222'], enderecos: ['Endereco 21', 'Endereco 22'], descricao: 'Descricao 2'),
    Loja(id: 3, nome: 'Loja 3', telefones: ['3333-1111', '3333-2222'], enderecos: ['Endereco 31', 'Endereco 32'], descricao: 'Descricao 3'),
  ];

  LojaBloc(){
    print('Instancia de LojaBloc criada');
    _filtroController.stream.listen(consultarLoja);
  }

  consultarLoja(idLoja) {
    print('LojaBloc idLoja '+ idLoja.toString());
    _lojaController.sink.add(_lojas.singleWhere((loja){ return loja.id == idLoja;}));
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