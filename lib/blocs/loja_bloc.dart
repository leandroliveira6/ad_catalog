import 'dart:async';

import 'package:ad_catalog/models/loja.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LojaBloc extends BlocBase {
  final _lojaController = StreamController<Loja>.broadcast();
  final _filtroController = StreamController<String>();

  final _colecaoLojas = Firestore.instance.collection("lojas");

  LojaBloc() {
    print('Instancia de LojaBloc criada');
    _filtroController.stream.listen(consultarLoja);
  }

  consultarLoja(idLoja) {
    print('LojaBloc idLoja ' + idLoja.toString());
    _colecaoLojas.document(idLoja).get().then(_obterLoja);
  }

  _obterLoja(DocumentSnapshot ds) {
    _lojaController.sink.add(Loja.fromJson({ds.documentID: ds.data}));
  }

  Stream get obterLoja => _lojaController.stream;
  Sink get especificarLoja => _filtroController.sink;

  @override
  void dispose() {
    _lojaController.close();
    _filtroController.close();
    super.dispose();
  }
}
