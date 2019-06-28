import 'package:ad_catalog/widgets/formulario_cadastro_anuncio_widget.dart';
import 'package:flutter/material.dart';

class CadastroAnuncioView extends StatelessWidget {
  CadastroAnuncioView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('COMPILANDO TELA DE CADASTRAR ANUNCIO');

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Anuncio'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: FormularioCadastroAnuncioWidget(),
      ),
    );
  }
}
