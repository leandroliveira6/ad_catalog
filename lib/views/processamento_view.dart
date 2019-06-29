import 'package:ad_catalog/blocs/processamento_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class ProcessamentoView extends StatelessWidget {
  const ProcessamentoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aguarde...'),
        centerTitle: true,
      ),
      body: _obterCorpo(context),
    );
  }

  Widget _obterCorpo(context) {
    final estaVisivel = ModalRoute.of(context).isCurrent;
    if (estaVisivel) {
      print('COMPILANDO TELA DE PROCESSAMENTO');
      return Container(
        padding: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: BlocProvider.getBloc<ProcessamentoBloc>().obterEstadoFuturo,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == 'concluido') {
                Future.delayed(Duration(seconds: 1)).then((resultado) {
                  Navigator.of(context).pop();
                });
              }
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      );
    }
    return Container();
  }
}
