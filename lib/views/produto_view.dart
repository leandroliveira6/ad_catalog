import 'package:ad_catalog/blocs/anuncios_bloc.dart';
import 'package:ad_catalog/models/produto.dart';
import 'package:ad_catalog/widgets/cartao_anuncio_widget.dart';
import 'package:ad_catalog/widgets/descricao_produto_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class ProdutoView extends StatelessWidget {
  final Produto produto;

  ProdutoView({this.produto});

  @override
  Widget build(BuildContext context) {
    print('COMPILANDO TELA DE PRODUTO');

    final AnunciosBloc bloc = BlocProvider.getBloc<AnunciosBloc>();
    bloc.filtrarAnuncios.add(<String, String>{'idProduto': produto.id});

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
              child: StreamBuilder<List>(
                stream: bloc.obterAnuncios,
                initialData: [],
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  final estaVisivel = ModalRoute.of(context).isCurrent;
                  print('Tela de produto visivel? ' + (estaVisivel ? 'Sim' : 'Nao'));
                  if (snapshot.hasData && estaVisivel) {
                    print('Lista de anuncios recebida');
                    if(snapshot.data.length == 0) return Container(); 
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(child: CartaoAnuncioWidget(anuncio: snapshot.data[index], produto: produto));
                      },
                    );
                  }
                  return Container(
                    child: Center(
                      child: estaVisivel ? CircularProgressIndicator() : Container(),
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
