import 'package:ad_catalog/blocs/usuario_bloc.dart';
import 'package:ad_catalog/views/cadastro_loja_view.dart';
import 'package:ad_catalog/widgets/formulario_login_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('COMPILANDO TELA DE LOGIN');
    final bloc = BlocProvider.getBloc<UsuarioBloc>();

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              'CADASTRAR LOJA',
              style: TextStyle(
                //fontSize: 20,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => CadastroLojaView(),
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: FormularioLoginWidget(),
      ),
    );
  }
}
