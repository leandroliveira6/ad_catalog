import 'package:ad_catalog/models/loja.dart';
import 'package:flutter/material.dart';

class LojaWidget {
  static Widget obterDescricao(BuildContext context, Loja loja) {
    return Row(
      children: <Widget>[
        Text('Descricao Loja'),
        Text('Imagem'),
        Column(
          children: <Widget>[
            //Text(produto.categoria),
            Text(loja.telefones.toString()),
            Text(loja.enderecos.toString()),
            Text(loja.descricao)
          ],
        )
      ],
    );
  }
}
