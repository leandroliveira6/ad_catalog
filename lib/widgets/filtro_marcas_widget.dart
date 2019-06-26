import 'package:ad_catalog/blocs/marcas_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class FiltroMarcasWidget extends StatelessWidget {
  const FiltroMarcasWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<MarcasBloc>();
    bloc.atualizarLista();
    return Container(
      height: 40,
      child: StreamBuilder<List<Map<String, bool>>>(
        stream: bloc.obterMarcas,
        initialData: [],
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, bool>>> snapshot) {
          if (snapshot.hasData && snapshot.data.length > 0) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final filtro = snapshot.data[index].keys.first.toString();
                return Padding(
                  padding: EdgeInsets.all(4.0),
                  child: RaisedButton(
                    color: snapshot.data[index][filtro]
                        ? Colors.grey
                        : Colors.pink,
                    elevation: 10,
                    onPressed: () {
                      bloc.alternarFiltros(filtro);
                    },
                    child: Text(filtro),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
