import 'dart:async';

import 'package:ad_catalog/models/anuncio.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class AnunciosBloc extends BlocBase {
  final _anunciosController = StreamController<List<Anuncio>>.broadcast();
  final _filtroController = StreamController<Map<String, int>>();

  AnunciosBloc() {
    print('Instancia de AnunciosBloc criada');
    _filtroController.stream.listen(consultarAnuncios);
  }

  consultarAnuncios(Map<String, int> idMap) {
    final lista = [
      Anuncio(id: 1, idLoja: 1, idProduto: 1, nomeLoja: 'Loja 1', descricao: 'anuncio 1', preco: 1.11),
      Anuncio(id: 2, idLoja: 1, idProduto: 2, nomeLoja: 'Loja 1', descricao: 'anuncio 2', preco: 2.22),
      Anuncio(id: 3, idLoja: 2, idProduto: 2, nomeLoja: 'Loja 1', descricao: 'anuncio 3', preco: 3.33),
      Anuncio(id: 4, idLoja: 3, idProduto: 3, nomeLoja: 'Loja 1', descricao: 'anuncio 4', preco: 4.44),
      Anuncio(id: 5, idLoja: 3, idProduto: 4, nomeLoja: 'Loja 1', descricao: 'anuncio 5', preco: 5.55)
    ];
    if (idMap.containsKey('idLoja')) {
      // criar lista filtrando por loja
      print(idMap['idLoja']);
      _anunciosController.sink.add(lista.where((anuncio) => anuncio.idLoja == idMap['idLoja']).toList());
    } else if (idMap.containsKey('idProduto')) {
      // criar lista filtrando por produto
      print(idMap['idProduto']);
      _anunciosController.sink.add(lista.where((anuncio) => anuncio.idProduto == idMap['idProduto']).toList());
    }
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
