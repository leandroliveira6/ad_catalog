import 'package:ad_catalog/blocs/sidebar_bloc.dart';
import 'package:ad_catalog/widgets/cabecalho_widget.dart';
import 'package:ad_catalog/widgets/opcoes_widget.dart';
import 'package:ad_catalog/widgets/filtro_categorias_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class SidebarWidget extends StatelessWidget {
  bool _ultimoEstado = false;

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
                initialData: _ultimoEstado,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  _ultimoEstado = snapshot.data;
                  if (_ultimoEstado) {
                    return OpcoesWidget();
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
