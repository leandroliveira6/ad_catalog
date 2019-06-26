import 'package:ad_catalog/models/produto.dart';
import 'package:flutter/material.dart';

class DescricaoProdutoWidget extends StatelessWidget {
  final Produto produto;
  final bool resumida;
  const DescricaoProdutoWidget({Key key, this.produto, this.resumida = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text('Descricao Produto'),
          Text('Imagem'),
          Column(
            children: <Widget>[
              //Text(produto.categoria),
              Text(produto.marca),
              Text(produto.modelo),
            ],
          )
        ],
      ),
    );
  }
}
