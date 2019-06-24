import 'package:ad_catalog/blocs/anuncios_bloc.dart';
import 'package:ad_catalog/models/produto.dart';
import 'package:ad_catalog/widgets/anuncio_widget.dart';
import 'package:ad_catalog/widgets/produto_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class ProdutoView extends StatelessWidget {
  Produto produto;
  ProdutoView({this.produto});

  @override
  Widget build(BuildContext context) {
    final AnunciosBloc bloc = BlocProvider.getBloc<AnunciosBloc>();
    bloc.filtrarAnuncios.add(<String, int>{'idProduto': produto.id});

    return Scaffold(
      appBar: AppBar(
        title: Text(produto.categoria),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ProdutoWidget.obterDescricao(context, produto),
            Expanded(
              child: StreamBuilder(
                stream: bloc.obterAnuncios,
                initialData: [],
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: AnuncioWidget.obterCard(context, snapshot.data[index])
                        );
                      },
                    );
                  }
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
