import 'package:ad_catalog/blocs/loja_bloc.dart';
import 'package:ad_catalog/blocs/opcoes_sidebar_bloc.dart';
import 'package:ad_catalog/blocs/usuario_bloc.dart';
import 'package:ad_catalog/delegates/localizations_deletage.dart';
import 'package:ad_catalog/widgets/imagem_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class CabecalhoWidget extends StatelessWidget {
  const CabecalhoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<UsuarioBloc>();
    final nomeLoja =
        bloc.estaLogado() == true ? ', ${bloc.obterLoja.nome}' : '';
    final emailLoja = bloc.estaLogado() == true
        ? '${bloc.obterLoja.email}'
        : DemoLocalizations.of(context).options;
    final imagemUrl =
        bloc.estaLogado() == true ? bloc.obterLoja.imagemUrl : null;

    return Container(
      color: Theme.of(context).primaryColorLight,
      child: UserAccountsDrawerHeader(
        onDetailsPressed: () {
          BlocProvider.getBloc<OpcoesSidebarBloc>().trocarCorpo();
        },
        currentAccountPicture: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColorDark,
          child: ImagemWidget(
              imagemUrl: imagemUrl,
              avatar: true,
              editavel: bloc.estaLogado() == true,
              salvarUrl: (url) => BlocProvider.getBloc<LojaBloc>()
                  .salvarUrl(url, bloc.obterLoja)),
        ),
        accountName: Text('${DemoLocalizations.of(context).hello}' + nomeLoja),
        accountEmail: Text(emailLoja),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))),
      ),
    );
  }
}
