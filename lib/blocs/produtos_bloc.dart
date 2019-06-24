import 'dart:async';

import 'package:ad_catalog/models/produto.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ProdutosBloc extends BlocBase {
  final _produtosController = StreamController<List<Produto>>();
  final _filtroController = StreamController<String>();

  ProdutosBloc() {
    print('Instancia de ProdutosBloc criada');
    _filtroController.stream.listen(consultarProdutos);
    filtrarProdutos.add(null); // para carregar todos os produtos inicialmente
  }

  consultarProdutos(categoria) {
    print(categoria); // filtrar por categoria, utilizar map para filtrar por mais campos
    _produtosController.sink.add([
      Produto(id: 1, categoria: 'Categoria 1', marca: 'Marca 1', modelo: 'Modelo 1'),
      Produto(id: 2, categoria: 'Categoria 2', marca: 'Marca 2', modelo: 'Modelo 2'),
      Produto(id: 3, categoria: 'Categoria 3', marca: 'Marca 3', modelo: 'Modelo 3'),
      Produto(id: 4, categoria: 'Categoria 4', marca: 'Marca 4', modelo: 'Modelo 4')
    ]);
  }

  Stream get obterProdutos => _produtosController.stream;
  Sink get filtrarProdutos => _filtroController.sink;

  @override
  void dispose() {
    _produtosController.close();
    _filtroController.close();
    super.dispose();
  }
}
