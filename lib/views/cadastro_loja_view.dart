import 'package:ad_catalog/widgets/formulario_cadastro_loja_widget.dart';
import 'package:flutter/material.dart';

class CadastroLojaView extends StatelessWidget {
  CadastroLojaView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('COMPILANDO TELA DE CADASTRAR LOJA');

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Loja'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: FormularioCadastroLojaWidget(),
      ),
    );
  }
}
