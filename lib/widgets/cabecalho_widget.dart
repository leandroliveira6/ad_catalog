import 'package:ad_catalog/blocs/opcoes_sidebar_bloc.dart';
import 'package:ad_catalog/blocs/usuario_bloc.dart';
import 'package:ad_catalog/delegates/localizations_deletage.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class CabecalhoWidget extends StatelessWidget {
  const CabecalhoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<UsuarioBloc>();
    final nomeLoja = bloc.estaLogado == true ? ', ${bloc.obterLoja.nome}' : '';
    final emailLoja = bloc.estaLogado == true ? '${bloc.obterLoja.email}' : '';

    return Container(
      child: UserAccountsDrawerHeader(
        onDetailsPressed: () {
          BlocProvider.getBloc<OpcoesSidebarBloc>().trocarCorpo();
        },
        currentAccountPicture: CircleAvatar(
          child: Icon(
            Icons.person,
            size: 40,
          ),
        ),
        otherAccountsPictures: <Widget>[
          Icon(
            Icons.offline_pin,
            color: Colors.green,
          ),
        ],
        accountName: Text('${DemoLocalizations.of(context).hello}' + nomeLoja),
        accountEmail: Text(DemoLocalizations.of(context).options),
        decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))),
      ),
    );
  }
}
