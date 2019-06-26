import 'package:ad_catalog/widgets/filtro_marcas_widget.dart';
import 'package:ad_catalog/widgets/produtos_widget.dart';
import 'package:ad_catalog/widgets/sidebar_widget.dart';
import 'package:flutter/material.dart';

class ProdutosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('COMPILANDO TELA DE PRODUTOS');

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogo'),
      ),
      drawer: SidebarWidget(),
      body: Container(
        //padding: EdgeInsets.only(10),
        child: Column(
          children: <Widget>[
            FiltroMarcasWidget(),
            Expanded(child: ProdutosWidget()),
          ],
        ),
      ),
    );
  }
}
