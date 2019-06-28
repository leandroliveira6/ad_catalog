import 'package:ad_catalog/blocs/anuncios_bloc.dart';
import 'package:ad_catalog/blocs/usuario_bloc.dart';
import 'package:ad_catalog/views/processamento_view.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class FormularioCadastroAnuncioWidget extends StatefulWidget {
  FormularioCadastroAnuncioWidget({Key key}) : super(key: key);

  _FormularioCadastroAnuncioWidgetState createState() => _FormularioCadastroAnuncioWidgetState();
}

class _FormularioCadastroAnuncioWidgetState extends State<FormularioCadastroAnuncioWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: 'Nome'),
              keyboardType: TextInputType.text,
              validator: (nome) {
                if (nome.isEmpty || nome.length < 3) return 'Campo obrigatorio';
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Usuario'),
              keyboardType: TextInputType.text,
              validator: (usuario) {
                if (usuario.isEmpty || usuario.length < 3)
                  return 'Campo obrigatorio';
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Senha'),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (senha) {
                if (senha.isEmpty || senha.length < 3)
                  return 'Campo obrigatorio';
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (email) {
                if (email.isEmpty || email.length < 3)
                  return 'Campo obrigatorio';
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Descricao'),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              child: Text(
                'Salvar',
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  final usuario = BlocProvider.getBloc<UsuarioBloc>().obterIdUsuario();
                  BlocProvider.getBloc<AnunciosBloc>().cadastrarAnuncio({});
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProcessamentoView()));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}