import 'package:flutter/material.dart';

class MensagemWidget extends StatelessWidget {
  final String mensagem;
  final Icons icone;
  const MensagemWidget({Key key, this.mensagem, this.icone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(mensagem),
    );
  }
}