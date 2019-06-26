import 'package:flutter/material.dart';

import 'package:ad_catalog/views/produto_view.dart';

class CartaoProdutoWidget extends StatelessWidget {
  final produto;
  const CartaoProdutoWidget({Key key, this.produto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
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
              Text('Card Produto'),
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
      ),
    );
  }
}
