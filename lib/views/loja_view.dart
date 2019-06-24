import 'package:ad_catalog/blocs/loja_bloc.dart';
import 'package:ad_catalog/models/anuncio.dart';
import 'package:ad_catalog/models/loja.dart';
import 'package:ad_catalog/models/produto.dart';
import 'package:ad_catalog/widgets/anuncio_widget.dart';
import 'package:ad_catalog/widgets/loja_widget.dart';
import 'package:ad_catalog/widgets/produto_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class LojaView extends StatelessWidget {
  final Anuncio anuncio;
  final Produto produto;

  LojaView({this.anuncio, this.produto});

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
          ProdutoWidget.obterDescricao(context, produto),
          AnuncioWidget.obterDescricao(context, anuncio),
          StreamBuilder(
            stream: BlocProvider.getBloc<LojaBloc>().obterLoja,
            initialData: null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print('Instancia de loja recebida');
                return Container(
                  child: LojaWidget.obterDescricao(context, snapshot.data),
                );
              }
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
