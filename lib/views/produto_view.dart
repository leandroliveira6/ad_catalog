import 'package:ad_catalog/models/produto.dart';
import 'package:ad_catalog/widgets/anuncios_widget.dart';
import 'package:ad_catalog/widgets/descricao_produto_widget.dart';
import 'package:flutter/material.dart';

class ProdutoView extends StatelessWidget {
  final Produto produto;

  ProdutoView({this.produto});

  @override
  Widget build(BuildContext context) {
    print('COMPILANDO TELA DE PRODUTO');

    return Scaffold(
      appBar: AppBar(
        title: Text(produto.categoria),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            DescricaoProdutoWidget(produto: produto),
            Expanded(
              child: AnunciosWidget(produto: produto),
            ),
          ],
        ),
      ),
    );
  }
}
