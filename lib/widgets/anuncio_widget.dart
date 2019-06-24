import 'package:ad_catalog/models/anuncio.dart';
import 'package:ad_catalog/views/loja_view.dart';
import 'package:flutter/material.dart';

class AnuncioWidget {
  static Widget obterCard(BuildContext context, Anuncio anuncio) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LojaView(anuncio: anuncio),
          ),
        );
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Text(anuncio.nomeLoja),
            Text(anuncio.descricao),
            Text(anuncio.preco.toString()),
          ],
        ),
      ),
    );
  }

  static Widget obterDescricao(BuildContext context, Anuncio anuncio) {
    return Card(
      child: Row(
        children: <Widget>[
          Text('Imagem'),
          Column(
            children: <Widget>[
              //Text(produto.categoria),
              Text(anuncio.nomeLoja),
              Text(anuncio.descricao),
              Text(anuncio.preco)
            ],
          )
        ],
      ),
    );
  }
}
