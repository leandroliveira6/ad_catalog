import 'package:ad_catalog/models/anuncio.dart';
import 'package:ad_catalog/models/produto.dart';
import 'package:ad_catalog/views/anuncio_view.dart';
import 'package:flutter/material.dart';

class CartaoAnuncioWidget extends StatelessWidget {
  final Anuncio anuncio;
  final Produto produto;
  const CartaoAnuncioWidget({Key key, this.anuncio, this.produto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AnuncioView(anuncio: anuncio, produto: produto),
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
      ),
    );
  }
}
