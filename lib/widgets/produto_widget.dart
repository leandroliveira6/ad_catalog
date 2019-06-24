import 'package:ad_catalog/models/produto.dart';
import 'package:ad_catalog/views/produto_view.dart';
import 'package:flutter/material.dart';

class ProdutoWidget {
  static Widget obterCard(BuildContext context, Produto produto) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProdutoView(produto: produto),
          ),
        );
      },
      child: Card(
        child: Row(
          children: <Widget>[
            Text('Imagem'),
            Column(
              children: <Widget>[
                Text(produto.categoria),
                Text(produto.marca),
                Text(produto.modelo),
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget obterDescricao(BuildContext context, Produto produto) {
    return Card(
      child: Row(
        children: <Widget>[
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
