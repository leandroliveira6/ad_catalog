import 'package:ad_catalog/blocs/categorias_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class FiltroCategoriasWidget extends StatelessWidget {
  const FiltroCategoriasWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<CategoriasBloc>();
    bloc.atualizarLista();
    return Container(
      child: StreamBuilder<List<Map<String, bool>>>(
        stream: bloc.obterCategorias,
        initialData: [],
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, bool>>> snapshot) {
          if (snapshot.hasData && snapshot.data.length > 0) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final filtro = snapshot.data[index].keys.first.toString();
                return ListTile(
                  title: Text(filtro),
                  selected: snapshot.data[index][filtro],
                  onTap: () {
                    bloc.alternarFiltros(filtro);
                    Navigator.pop(context);
                  },
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

/*
color: snapshot.data[index][filtro] ? Colors.grey : Colors.pink,
                  elevation: 10,
                  onPressed: () {
                    print('Filtro: ' + filtro);
                    print('Ativo? ' + snapshot.data[index][filtro].toString());
                    bloc.alternarFiltros(filtro);
                  },
 */
