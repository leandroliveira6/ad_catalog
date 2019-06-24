import 'dart:async';

import 'package:ad_catalog/models/produto.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ProdutosBloc extends BlocBase {
  final _produtosController = StreamController<List<Produto>>();
  final _filtroController = StreamController<Map<String, Map<String, String>>>();
  Map<String, String> filtros = Map<String, String>();

  final _categoriasController = StreamController<List<String>>();
  final _marcasController = StreamController<List<String>>();

  ProdutosBloc() {
    print('Instancia de ProdutosBloc criada');
    _filtroController.stream.listen(consultarProdutos);
  }

  // LISTA PARA DEBUG
  final _produtos = [
    Produto(id: 1, categoria: 'Categoria 1', marca: 'Marca 1', modelo: 'Modelo 1'),
    Produto(id: 2, categoria: 'Categoria 2', marca: 'Marca 2', modelo: 'Modelo 2'),
    Produto(id: 3, categoria: 'Categoria 3', marca: 'Marca 3', modelo: 'Modelo 3'),
    Produto(id: 4, categoria: 'Categoria 4', marca: 'Marca 4', modelo: 'Modelo 4')
  ];

  consultarProdutos(Map<String, Map<String, String>> filtro) {
    if(filtro == null){
      print('Consultar todos os produtos');
      filtros.clear();
      _produtosController.sink.add(_produtos);
    }
    else{
      print('Consultar produtos especificos');
      if(filtro.containsKey('adicionarFiltro')){
        filtros.addAll(filtro['adicionarFiltro']);
      } else {
        final chave = filtro['removerFiltro'].keys.first;
        if(chave == 'categoria'){
          _categoriasController.sink.add([]); // readicionar todas as categorias
        } else{
          _marcasController.sink.add([]); // readicionar todas as marcas
        }
        filtros.remove(filtro['removerFiltro'][chave]);
      }
      // 1) obtem todos os produtos
      if(filtros.containsKey('categoria')){
        // 2) filtra por categoria
        _categoriasController.sink.add([filtros['categoria']]);
      }
      else if(filtros.containsKey('marca')){
        // e/ou 3) filtra por marca
        _marcasController.sink.add([filtros['marca']]);
      }
    }
  }

  Stream get obterProdutos => _produtosController.stream;
  Sink get filtrarProdutos => _filtroController.sink;

  Stream get obterCategorias => _categoriasController.stream;
  Stream get obterMarcas => _marcasController.stream;

  @override
  void dispose() {
    _produtosController.close();
    _filtroController.close();
    _categoriasController.close();
    _marcasController.close();
    super.dispose();
  }
}
