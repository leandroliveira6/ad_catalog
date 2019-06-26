import 'package:ad_catalog/blocs/anuncios_bloc.dart';
import 'package:ad_catalog/blocs/categorias_bloc.dart';
import 'package:ad_catalog/blocs/loja_bloc.dart';
import 'package:ad_catalog/blocs/marcas_bloc.dart';
import 'package:ad_catalog/blocs/produtos_bloc.dart';
import 'package:ad_catalog/blocs/sidebar_bloc.dart';
import 'package:ad_catalog/views/produtos_view.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalogo de Anuncios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        blocs: [
          Bloc((i) => ProdutosBloc()),
          Bloc((i) => AnunciosBloc()),
          Bloc((i) => LojaBloc()),
          Bloc((i) => SidebarBloc()),
          Bloc((i) => MarcasBloc()),
          Bloc((i) => CategoriasBloc()),
        ],
        child: ProdutosView(),
      ),
    );
  }
}
