
import 'package:flutter/material.dart';

class ProdutosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('COMPILANDO TELA DE ANUNCIOS');

    return Scaffold(
      appBar: AppBar(
        title: Text('Anuncios'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
          return Text('Quallquer coisa $index');
         },
        ),
      ),
    );
  }
}
