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
              Text(anuncio.nomeLoja),
              Text(anuncio.categoria),
              Text(anuncio.marca),
              Text(anuncio.modelo),
              Text(anuncio.valor.toString()),
              Text(anuncio.descricao),
            ],
          )
        ],
      ),
    );
  }
}
