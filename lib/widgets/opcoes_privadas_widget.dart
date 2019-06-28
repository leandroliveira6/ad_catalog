import 'package:ad_catalog/blocs/usuario_bloc.dart';
import 'package:ad_catalog/views/processamento_view.dart';
import 'package:ad_catalog/widgets/anuncios_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class OpcoesPrivadasWidget extends StatelessWidget {
  const OpcoesPrivadasWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("Logout"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              BlocProvider.getBloc<UsuarioBloc>().deslogar();
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProcessamentoView()));
            },
          ),
          ListTile(
            title: Text("Anuncios"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AnunciosWidget()));
            },
          ),
        ],
      ),
    );
  }
}
