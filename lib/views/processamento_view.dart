import 'package:ad_catalog/blocs/processamento_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class ProcessamentoView extends StatefulWidget {
  ProcessamentoView({Key key}) : super(key: key);

  _ProcessamentoViewState createState() => _ProcessamentoViewState();
}

class _ProcessamentoViewState extends State<ProcessamentoView> {
 @override
  Widget build(BuildContext context) {
    print('COMPILANDO TELA DE PROCESSAMENTO');
    final bloc = BlocProvider.getBloc<ProcessamentoBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Aguarde...'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: bloc.obterEstadoFuturo,
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
      ),
    );
  }
}
