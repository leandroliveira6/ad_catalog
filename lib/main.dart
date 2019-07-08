import 'package:ad_catalog/blocs/anuncios_bloc.dart';
import 'package:ad_catalog/blocs/categorias_bloc.dart';
import 'package:ad_catalog/blocs/imagem_bloc.dart';
import 'package:ad_catalog/blocs/internet_bloc.dart';
import 'package:ad_catalog/blocs/localizations_bloc.dart';
import 'package:ad_catalog/blocs/loja_bloc.dart';
import 'package:ad_catalog/blocs/marcas_bloc.dart';
import 'package:ad_catalog/blocs/processamento_bloc.dart';
import 'package:ad_catalog/blocs/produtos_bloc.dart';
import 'package:ad_catalog/blocs/opcoes_sidebar_bloc.dart';
import 'package:ad_catalog/blocs/usuario_bloc.dart';
import 'package:ad_catalog/delegates/localizations_deletage.dart';
import 'package:ad_catalog/views/produtos_view.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        Bloc((i) => OpcoesSidebarBloc()),
        Bloc((i) => MarcasBloc()),
        Bloc((i) => CategoriasBloc()),
        Bloc((i) => LocalizationsBloc()),
        Bloc((i) => UsuarioBloc()),
        Bloc((i) => ProcessamentoBloc()),
        Bloc((i) => ImagemBloc()),
        Bloc((i) => InternetBloc()),
      ],
      child: CarregamentoView(),
    );
  }
}

class CarregamentoView extends StatelessWidget {
  const CarregamentoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.getBloc<UsuarioBloc>().carregarUsuario();
    return Container(
      color: Color(0xFFD6D3AE),
      child: StreamBuilder(
        stream: BlocProvider.getBloc<UsuarioBloc>().acompanharCarregamento,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data == 'carregou') {
            return CustomMaterialView();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Ad Catalog',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'comic sans'),
              ),
              SizedBox(height: 40),
              RefreshProgressIndicator(
                  semanticsLabel: 'Carregando...',
                  strokeWidth: 6,
                  backgroundColor: Color(0xFFBF565B)),
            ],
          );
        },
      ),
    );
  }
}

class CustomMaterialView extends StatelessWidget {
  const CustomMaterialView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.getBloc<LocalizationsBloc>().atualizarIdioma,
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
            supportedLocales: BlocProvider.getBloc<LocalizationsBloc>()
                .obterIdiomas
                .map((language) => Locale(language, '')),
            //title: DemoLocalizations.of(context).title,
            onGenerateTitle: (BuildContext context) =>
                DemoLocalizations.of(context).title,
            theme: ThemeData(
                primaryColor: Color(0xFF865f61),
                primaryColorBrightness: Brightness.dark,
                primaryColorDark: Color(0xFFBF565B),
                primaryColorLight: Color(0xFFc0a5a7),
                backgroundColor: Color(0xFFD6D3AE),
                cardColor: Color(0xFFF0EDCE),
                buttonColor: Color(0x99BF565B)),
            home: StreamBuilder(
              stream: BlocProvider.getBloc<InternetBloc>().estadoInternet,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.hasData){
                  if(snapshot.data == 'conectado'){
                    return ProdutosView();
                  }
                  return Container(
                    color: Colors.redAccent,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.signal_wifi_off,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width / 2,
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Desconectado!',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
