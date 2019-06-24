import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

import 'blocs/anuncios_bloc.dart';
import 'blocs/loja_bloc.dart';
import 'blocs/produtos_bloc.dart';
import 'views/produtos_view.dart';

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
          Bloc((i) => LojaBloc())
        ],
        child: ProdutosView(),
      ),
    );
  }
}
