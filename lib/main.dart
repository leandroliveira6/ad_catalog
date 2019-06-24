import 'package:ad_catalog/blocs/anuncios_bloc.dart';
import 'package:ad_catalog/blocs/produtos_bloc.dart';
import 'package:flutter/material.dart';

import 'views/produtos_view.dart';
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
          Bloc((i) => AnunciosBloc())
        ],
        child: ProdutosView(),
      ),
    );
  }
}
