import 'package:ad_catalog/blocs/usuario_bloc.dart';
import 'package:ad_catalog/views/processamento_view.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class FormularioLoginWidget extends StatefulWidget {
  FormularioLoginWidget({Key key}) : super(key: key);

  _FormularioLoginWidgetState createState() => _FormularioLoginWidgetState();
}

class _FormularioLoginWidgetState extends State<FormularioLoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _senhaTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _emailTextController,
              decoration: InputDecoration(hintText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (usuario) {
                if (usuario.isEmpty || usuario.length < 6)
                  return 'Campo obrigatorio e com no minimo 6 caracteres';
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _senhaTextController,
              decoration: InputDecoration(hintText: 'Senha'),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (senha) {
                if (senha.isEmpty || senha.length < 6)
                  return 'Campo obrigatorio e com no minimo 6 caracteres';
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                padding: EdgeInsets.zero,
                child: Text('Recuperar senha'),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Text(
                'Entrar',
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  BlocProvider.getBloc<UsuarioBloc>().logar(
                      _emailTextController.text, _senhaTextController.text);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProcessamentoView()));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
