import 'package:ad_catalog/blocs/produtos_bloc.dart';
import 'package:ad_catalog/widgets/produto_widget.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class ProdutosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('COMPILANDO TELA DE PRODUTOS');

    final ProdutosBloc bloc = BlocProvider.getBloc<ProdutosBloc>();
    bloc.filtrarProdutos.add(null);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogo'),
      ),
      body: StreamBuilder(
        stream: bloc.obterProdutos,
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          final estaVisivel = ModalRoute.of(context).isCurrent;
          print('Tela de produtos visivel? ' + (estaVisivel ? 'Sim' : 'Nao'));
          if (snapshot.hasData && snapshot.data.length > 0 && estaVisivel) {
            print('Lista de produtos recebida');
            print(snapshot.data);
            return Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProdutoWidget.obterCard(context, snapshot.data[index]);
                },
              ),
            );
          }
          return Container(
              child: Center(
            child: estaVisivel ? CircularProgressIndicator() : Container(),
          ));
        },
      ),
    );
  }
}
