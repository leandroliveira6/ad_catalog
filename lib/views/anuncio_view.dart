import 'package:ad_catalog/models/anuncio.dart';
import 'package:ad_catalog/models/produto.dart';
import 'package:ad_catalog/widgets/anuncio_widget.dart';
import 'package:flutter/material.dart';

class AnuncioView extends StatelessWidget {
  final Anuncio anuncio;
  final Produto produto;

  AnuncioView({this.anuncio, this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anuncio.valor.toString()),
        centerTitle: true,
      ),
      body: _obterCorpo(context),
    );
  }

  Widget _obterCorpo(context) {
    final estaVisivel = ModalRoute.of(context).isCurrent;
    if (estaVisivel) {
      print('COMPILANDO TELA DE ANUNCIO');
      return Container(
        padding: EdgeInsets.all(10),
        child: AnuncioWidget(
          anuncio: anuncio,
        ),
      );
    }
    return Container();
  }
}
