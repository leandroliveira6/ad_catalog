import 'package:ad_catalog/blocs/sidebar_bloc.dart';
import 'package:ad_catalog/widgets/cabecalho_widget.dart';
import 'package:ad_catalog/widgets/opcoes_usuario_widget.dart';
import 'package:ad_catalog/widgets/filtro_categorias_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class SidebarWidget extends StatelessWidget {
  bool opcoesDeUsuario = false;

  SidebarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Column(
          children: <Widget>[
            CabecalhoWidget(),
            Expanded(
              child: StreamBuilder(
                stream:
                    BlocProvider.getBloc<SidebarBloc>().detalhesUsuarioAtivo,
                initialData: false,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data) {
                    return OpcoesUsuarioWidget();
                  }
                  return FiltroCategoriasWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
