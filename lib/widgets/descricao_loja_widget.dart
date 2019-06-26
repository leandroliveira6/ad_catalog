import 'package:ad_catalog/models/loja.dart';
import 'package:flutter/material.dart';

class DescricaoLojaWidget extends StatelessWidget {
  final Loja loja;
  const DescricaoLojaWidget({Key key, this.loja}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
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
      ),
    );
  }
}
