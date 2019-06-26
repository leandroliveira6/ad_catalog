import 'package:ad_catalog/models/anuncio.dart';
import 'package:flutter/material.dart';

class DescricaoAnuncioWidget extends StatelessWidget {
  final Anuncio anuncio;
  const DescricaoAnuncioWidget({Key key, this.anuncio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
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
      ),
    );
  }
}
