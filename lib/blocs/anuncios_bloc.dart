import 'dart:async';

import 'package:ad_catalog/blocs/processamento_bloc.dart';
import 'package:ad_catalog/models/anuncio.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class AnunciosBloc extends BlocBase {
  final _anunciosController = BehaviorSubject<List<Anuncio>>();
  final _colecaoAnuncios = Firestore.instance.collection("anuncios");

  List<Anuncio> _listaAnuncios = [];

  Stream get obterAnuncios => _anunciosController.stream;

  AnunciosBloc() {
    print('Instancia de AnunciosBloc criada');
  }

  void especificarAnuncios(campoId, valorId) {
    print('ANUNCIOS BLOC: Especificando anuncios. Campo: $campoId Valor: $valorId');
    Query query;
    if (campoId == 'idProduto') {
      query = _colecaoAnuncios.orderBy('valor').where(campoId, isEqualTo: valorId);
    } else {
      query = _colecaoAnuncios.where(campoId, isEqualTo: valorId);
    }
    query.getDocuments().then(_criarLista).whenComplete(_enviarLista);
  }

  void cadastrarAnuncio(anuncio) {
    final colecaoProdutos = Firestore.instance.collection("produtos");
    BlocProvider.getBloc<ProcessamentoBloc>()
        .atualizarEstadoPara('processando');

    colecaoProdutos
        .where('categoria', isEqualTo: anuncio['categoria'])
        .where('marca', isEqualTo: anuncio['marca'])
        .where('modelo', isEqualTo: anuncio['modelo'])
        .getDocuments()
        .then((qs) {
      if (qs.documents.isEmpty) {
        colecaoProdutos.add({
          'categoria': anuncio['categoria'],
          'marca': anuncio['marca'],
          'modelo': anuncio['modelo'],
          'clicks': 0
        }).then((dsProduto) {
          final colecaoCategorias = Firestore.instance.collection("categorias");
          final colecaoMarcas = Firestore.instance.collection("marcas");
          colecaoCategorias
              .document(anuncio['categoria'])
              .get()
              .then((dsCategoria) {
            if (!dsCategoria.exists) {
              dsCategoria.reference.setData({'clicks': 0});
            }
          });
          colecaoMarcas.document(anuncio['marca']).get().then((dsMarca) {
            if (!dsMarca.exists) {
              dsMarca.reference.setData({'clicks': 0});
            }
          });
          _finalizarCadastro(dsProduto.documentID, anuncio);
        });
      } else {
        _finalizarCadastro(qs.documents.first.documentID, anuncio);
      }
    });
  }

  _finalizarCadastro(idProduto, anuncio) {
    anuncio['idProduto'] = idProduto;
    _colecaoAnuncios.document().setData(anuncio).then((ds) {
      BlocProvider.getBloc<ProcessamentoBloc>()
          .atualizarEstadoPara('concluido');
    });
  }

  _criarLista(QuerySnapshot qs) {
    _listaAnuncios.clear();
    qs.documents.forEach((ds) {
      _listaAnuncios.add(Anuncio.fromJson({ds.documentID: ds.data}));
    });
  }

  _enviarLista() {
    _anunciosController.sink.add(_listaAnuncios);
  }

  @override
  void dispose() {
    _anunciosController.close();
    super.dispose();
  }
}
