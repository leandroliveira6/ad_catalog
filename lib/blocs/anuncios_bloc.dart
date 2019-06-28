import 'dart:async';

import 'package:ad_catalog/models/anuncio.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnunciosBloc extends BlocBase {
  final _anunciosController = StreamController<List<Anuncio>>.broadcast();
  final _colecaoAnuncios = Firestore.instance.collection("anuncios");

  List<Anuncio> _listaAnuncios = [];

  Stream get obterAnuncios => _anunciosController.stream;

  AnunciosBloc() {
    print('Instancia de AnunciosBloc criada');
  }

  void especificarAnuncios(campo, valor) {
    _colecaoAnuncios.where(campo, isEqualTo: valor).getDocuments().then(_criarLista).whenComplete(_enviarLista);
  }

  void cadastrarAnuncio(formulario){

  }

  _criarLista(QuerySnapshot qs){
    _listaAnuncios.clear();
    qs.documents.forEach((ds){
      _listaAnuncios.add(Anuncio.fromJson({ds.documentID: ds.data}));
    });
  }

  _enviarLista(){
    _anunciosController.sink.add(_listaAnuncios);
  }

  @override
  void dispose() {
    _anunciosController.close();
    super.dispose();
  }
}
