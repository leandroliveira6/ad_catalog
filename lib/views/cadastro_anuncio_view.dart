import 'package:ad_catalog/widgets/formulario_cadastro_anuncio_widget.dart';
import 'package:flutter/material.dart';

class CadastroAnuncioView extends StatelessWidget {
  CadastroAnuncioView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Anuncio'),
        centerTitle: true,
      ),
      body: _obterCorpo(context),
    );
  }

  Widget _obterCorpo(context) {
    final estaVisivel = ModalRoute.of(context).isCurrent;
    if (estaVisivel) {
      print('COMPILANDO TELA DE CADASTRAR ANUNCIO');
      return Container(
        padding: EdgeInsets.all(20),
        child: FormularioCadastroAnuncioWidget(),
      );
    }
    return Container();
  }
}
