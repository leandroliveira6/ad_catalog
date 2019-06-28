import 'package:ad_catalog/blocs/anuncios_bloc.dart';
import 'package:ad_catalog/models/loja.dart';
import 'package:ad_catalog/models/produto.dart';
import 'package:ad_catalog/widgets/cartao_anuncio_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class AnunciosWidget extends StatelessWidget {
  final Produto produto;
  final Loja loja;
  const AnunciosWidget({Key key, this.produto, this.loja}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<AnunciosBloc>();
    if(produto != null){
      bloc.especificarAnuncios('idProduto', produto.id);
    }
    else if(loja != null){
      bloc.especificarAnuncios('idLoja', loja.id);
    }
    else{
      bloc.especificarAnuncios('idProduto', -1);
    }

    return Container(
      child: StreamBuilder<List>(
        stream: bloc.obterAnuncios,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            final estaVisivel = ModalRoute.of(context).isCurrent;
            if (estaVisivel) {
              print('Lista de anuncios recebida');
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: CartaoAnuncioWidget(
                        anuncio: snapshot.data[index], produto: produto),
                  );
                },
              );
            }
            return Container();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
