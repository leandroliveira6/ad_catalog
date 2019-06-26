import 'package:ad_catalog/blocs/loja_bloc.dart';
import 'package:ad_catalog/models/anuncio.dart';
import 'package:ad_catalog/models/produto.dart';
import 'package:ad_catalog/widgets/descricao_anuncio_widget.dart';
import 'package:ad_catalog/widgets/descricao_loja_widget.dart';
import 'package:ad_catalog/widgets/descricao_produto_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class AnuncioView extends StatelessWidget {
  final Anuncio anuncio;
  final Produto produto;

  AnuncioView({this.anuncio, this.produto});

  @override
  Widget build(BuildContext context) {
    print('COMPILANDO TELA DE LOJA');

    final LojaBloc bloc = BlocProvider.getBloc<LojaBloc>();
    bloc.especificarLoja.add(anuncio.idLoja);

    return Scaffold(
      appBar: AppBar(
        title: Text(anuncio.nomeLoja),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          DescricaoProdutoWidget(produto: produto, resumida: true),
          DescricaoAnuncioWidget(anuncio: anuncio),
          StreamBuilder(
            stream: BlocProvider.getBloc<LojaBloc>().obterLoja,
            initialData: null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              final estaVisivel = ModalRoute.of(context).isCurrent;
              print('Tela de loja visivel? ' + (estaVisivel ? 'Sim' : 'Nao'));
              if (snapshot.hasData && estaVisivel) {
                print('Instancia de loja recebida');
                return Container(
                  child: DescricaoLojaWidget(loja: snapshot.data),
                );
              }
              return Container(
                child: Center(
                  child: estaVisivel ? CircularProgressIndicator() : Container(),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
