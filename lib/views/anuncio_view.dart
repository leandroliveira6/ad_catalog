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
    print('COMPILANDO TELA DE LOJA');

    return Scaffold(
      appBar: AppBar(
        title: Text(anuncio.nomeLoja),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: AnuncioWidget(
          produto: produto,
          anuncio: anuncio,
        ),
      ),
    );
  }
}
