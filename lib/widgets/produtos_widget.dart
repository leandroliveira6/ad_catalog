import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'package:ad_catalog/blocs/produtos_bloc.dart';
import 'package:ad_catalog/widgets/cartao_produto_widget.dart';

class ProdutosWidget extends StatelessWidget {
  const ProdutosWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProdutosBloc bloc = BlocProvider.getBloc<ProdutosBloc>();
    //bloc.filtros = {'categoria': 'Placa Mae'};
    bloc.atualizarProdutos();

    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      color: Colors.teal,
      child: StreamBuilder<List>(
        stream: bloc.obterProdutos,
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          final estaVisivel = ModalRoute.of(context).isCurrent;
          if (snapshot.hasData && estaVisivel) {
            print('Lista de produtos recebida');
            if (snapshot.data.length == 0) {
              return Container();
            }

            return Container(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartaoProdutoWidget(produto: snapshot.data[index]);
                },
              ),
            );
          }
          return Container(
              child: Center(
            child: estaVisivel ? CircularProgressIndicator() : Container(),
          ));
        },
      ),
    );
  }
}
