import 'package:ad_catalog/widgets/opcoes_privadas_widget.dart';
import 'package:ad_catalog/widgets/opcoes_publicas_widget.dart';
import 'package:ad_catalog/widgets/rodape_widget.dart';
import 'package:flutter/material.dart';

class OpcoesWidget extends StatelessWidget {
  const OpcoesWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          OpcoesPublicasWidget(),
          RodapeWidget(),
        ],
      ),
    );
  }
}
