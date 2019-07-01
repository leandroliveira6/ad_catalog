import 'package:ad_catalog/blocs/anuncios_bloc.dart';
import 'package:ad_catalog/blocs/loja_bloc.dart';
import 'package:ad_catalog/blocs/usuario_bloc.dart';
import 'package:ad_catalog/models/anuncio.dart';
import 'package:ad_catalog/widgets/imagem_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class AnuncioWidget extends StatelessWidget {
  Anuncio anuncio;
  final editavel;
  AnuncioWidget({Key key, this.anuncio, this.editavel = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.getBloc<UsuarioBloc>();
    final anunciosBloc = BlocProvider.getBloc<AnunciosBloc>();
    final imagemWidget = ImagemWidget(
        imagemUrl: anuncio.imagemUrl,
        editavel: editavel,
        salvarUrl: (url) => anunciosBloc.salvarUrl(url, anuncio));
    final bloc = BlocProvider.getBloc<LojaBloc>();
    bloc.especificarLoja(anuncio.idLoja);

    return Container(
      child: ListView(children: <Widget>[
        imagemWidget,
        ListTile(
          title: Text('${anuncio.categoria} ${anuncio.marca}'),
          subtitle: Text('${anuncio.modelo}'),
          trailing: Text('R\$ ${anuncio.valor.toString()}',
              style: TextStyle(fontSize: 20)),
        ),
        ListTile(
          title: Text('${anuncio.nomeLoja} (Atualizado)'),
          subtitle: Text(
            '${anuncio.descricao}',
          ),
        ),
        StreamBuilder(
          stream: bloc.obterLoja,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.estaVazia()) {
                return Container();
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Telefone: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(
                            '${snapshot.data.telefone}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('Endereco: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(
                            snapshot.data.endereco != null
                                ? '${snapshot.data.endereco}'
                                : 'Sem endereco',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Text('Sobre a loja:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(
                        '${snapshot.data.descricao}',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                );
              }
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ]),
    );
  }
}
