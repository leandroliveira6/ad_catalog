import 'package:ad_catalog/widgets/formulario_cadastro_loja_widget.dart';
import 'package:flutter/material.dart';

class CadastroLojaView extends StatelessWidget {
  CadastroLojaView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Loja'),
        centerTitle: true,
      ),
      body: _obterCorpo(context),
    );
  }

  Widget _obterCorpo(context) {
    final estaVisivel = ModalRoute.of(context).isCurrent;
    if (estaVisivel) {
      print('COMPILANDO TELA DE CADASTRAR LOJA');
      return Container(
        padding: EdgeInsets.all(20),
        child: FormularioCadastroLojaWidget(),
      );
    }
    return Container();
  }
}
