import 'package:ad_catalog/blocs/anuncios_bloc.dart';
import 'package:ad_catalog/blocs/categorias_bloc.dart';
import 'package:ad_catalog/blocs/localizations_bloc.dart';
import 'package:ad_catalog/blocs/loja_bloc.dart';
import 'package:ad_catalog/blocs/marcas_bloc.dart';
import 'package:ad_catalog/blocs/produtos_bloc.dart';
import 'package:ad_catalog/blocs/sidebar_bloc.dart';
import 'package:ad_catalog/delegates/localizations_deletage.dart';
import 'package:ad_catalog/views/produtos_view.dart';

import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => ProdutosBloc()),
        Bloc((i) => AnunciosBloc()),
        Bloc((i) => LojaBloc()),
        Bloc((i) => SidebarBloc()),
        Bloc((i) => MarcasBloc()),
        Bloc((i) => CategoriasBloc()),
        Bloc((i) => LocalizationsBloc()),
      ],
      child: CustomMaterialApp(),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<LocalizationsBloc>();

    return StreamBuilder(
      stream: bloc.obterIdioma,
      initialData: 'pt',
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            locale: Locale(snapshot.data),
            localizationsDelegates: [
              DemoLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: bloc.obterIdiomas.map((language) => Locale(language, '')),
            //title: DemoLocalizations.of(context).title,
            onGenerateTitle: (BuildContext context) =>
                DemoLocalizations.of(context).title,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: ProdutosView(),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
