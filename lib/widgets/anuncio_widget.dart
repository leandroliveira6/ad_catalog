import 'package:ad_catalog/blocs/loja_bloc.dart';
import 'package:ad_catalog/widgets/descricao_anuncio_widget.dart';
import 'package:ad_catalog/widgets/descricao_loja_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class AnuncioWidget extends StatelessWidget {
  final anuncio;
  const AnuncioWidget({Key key, this.anuncio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<LojaBloc>();
    bloc.especificarLoja(anuncio.idLoja);

    return Container(
      child: Column(children: <Widget>[
        DescricaoAnuncioWidget(anuncio: anuncio),
        StreamBuilder(
          stream: bloc.obterLoja,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: DescricaoLojaWidget(loja: snapshot.data),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ]),
    );
  }
}
