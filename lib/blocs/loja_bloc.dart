import 'dart:async';

import 'package:ad_catalog/models/loja.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LojaBloc extends BlocBase {
  final _lojaController = StreamController<Loja>.broadcast();
  final _colecaoLojas = Firestore.instance.collection("lojas");

  Loja _loja;

  Stream get obterLoja => _lojaController.stream;

  LojaBloc() {
    print('Instancia de LojaBloc criada');
  }

  void especificarLoja(idLoja) {
    _colecaoLojas.document(idLoja).get().then(_ciarLoja).whenComplete(_enviarLoja);
  }

  void _ciarLoja(ds) {
    _loja = Loja.fromJson({ds.documentID: ds.data});
  }

  void _enviarLoja(){
    _lojaController.sink.add(_loja);
  }

  @override
  void dispose() {
    _lojaController.close();
    super.dispose();
  }
}
