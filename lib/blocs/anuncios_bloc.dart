import 'dart:async';

import 'package:ad_catalog/models/anuncio.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnunciosBloc extends BlocBase {
  final _anunciosController = StreamController<List<Anuncio>>.broadcast();
  final _filtroController = StreamController<Map<String, String>>();

  final _colecaoAnuncios = Firestore.instance.collection("anuncios");

  AnunciosBloc() {
    print('Instancia de AnunciosBloc criada');
    _filtroController.stream.listen(consultarAnuncios);
  }

  consultarAnuncios(Map<String, String> idMap) {
    if (idMap.containsKey('idLoja')) {
      // criar lista filtrando por loja
      print('idLoja recebido ' + idMap['idLoja']);
      _colecaoAnuncios.where('idLoja', isEqualTo: idMap['idLoja']).getDocuments().then(_atualizarListaDeAnuncios);
      //_anunciosController.sink.add(lista.where((anuncio) => anuncio.idLoja == idMap['idLoja']).toList());
    } else if (idMap.containsKey('idProduto')) {
      // criar lista filtrando por produto
      print('idProduto recebido ' + idMap['idProduto']);
      _colecaoAnuncios.where('idProduto', isEqualTo: idMap['idProduto']).getDocuments().then(_atualizarListaDeAnuncios);
      //_anunciosController.sink.add(lista.where((anuncio) => anuncio.idProduto == idMap['idProduto']).toList());
    } else {
      _anunciosController.sink.add([]);
    }
  }

  _atualizarListaDeAnuncios(QuerySnapshot qs){
    List<Anuncio> listaDeAnuncios = qs.documents.map<Anuncio>((snapshotDocument){
      print('Entrou?');
      return Anuncio.fromJson({snapshotDocument.documentID: snapshotDocument.data});
    }).toList();
    _anunciosController.sink.add(listaDeAnuncios);
  }

  Stream get obterAnuncios => _anunciosController.stream;
  Sink get filtrarAnuncios => _filtroController.sink;

  @override
  void dispose() {
    _anunciosController.close();
    _filtroController.close();
    super.dispose();
  }
}
