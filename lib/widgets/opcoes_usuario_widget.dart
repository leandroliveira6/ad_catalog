import 'package:ad_catalog/widgets/menu_opcoes_widget.dart';
import 'package:ad_catalog/widgets/rodape_widget.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';

class OpcoesUsuarioWidget extends StatelessWidget {
  const OpcoesUsuarioWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MenuOpcoesWidget(),
          RodapeWidget(),
        ],
      ),
    );
  }
}
