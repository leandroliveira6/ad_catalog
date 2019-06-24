import 'package:ad_catalog/models/anuncio.dart';
import 'package:ad_catalog/models/produto.dart';
import 'package:ad_catalog/views/loja_view.dart';
import 'package:flutter/material.dart';

class AnuncioWidget {
  static Widget obterCard(BuildContext context, Anuncio anuncio, Produto produto) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LojaView(anuncio: anuncio, produto: produto),
          ),
        );
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Text('Card Anuncio'),
            Text(anuncio.nomeLoja),
            Text(anuncio.descricao),
            Text(anuncio.preco.toString()),
          ],
        ),
      ),
    );
  }

  static Widget obterDescricao(BuildContext context, Anuncio anuncio) {
    return Row(
      children: <Widget>[
        Text('Descricao Anuncio'),
        Text('Imagem'),
        Column(
          children: <Widget>[
            //Text(produto.categoria),
            Text(anuncio.nomeLoja),
            Text(anuncio.descricao),
            Text(anuncio.preco.toString())
          ],
        )
      ],
    );
  }
}
