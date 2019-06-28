import 'package:ad_catalog/blocs/usuario_bloc.dart';
import 'package:ad_catalog/views/processamento_view.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class FormularioCadastroLojaWidget extends StatefulWidget {
  FormularioCadastroLojaWidget({Key key}) : super(key: key);

  _FormularioCadastroLojaWidgetState createState() =>
      _FormularioCadastroLojaWidgetState();
}

class _FormularioCadastroLojaWidgetState
    extends State<FormularioCadastroLojaWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nomeTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _senhaTextController = TextEditingController();
  final _confirmarSenhaTextController = TextEditingController();
  final _descricaoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _nomeTextController,
              decoration: InputDecoration(hintText: 'Nome'),
              keyboardType: TextInputType.text,
              validator: (nome) {
                if (nome.isEmpty || nome.length < 3)
                  return 'Campo obrigatorio e com no minimo 3 caracteres';
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _emailTextController,
              decoration: InputDecoration(hintText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (email) {
                if (email.isEmpty || email.length < 6)
                  return 'Campo obrigatorio e com no minimo 6 caracteres';
                if (!email.contains('@')) {
                  return 'Email invalido';
                }
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _senhaTextController,
              decoration: InputDecoration(hintText: 'Senha'),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (senha) {
                if (senha.isEmpty || senha.length < 6) {
                  return 'Campo obrigatorio e com no minimo 6 caracteres';
                }
                if (_confirmarSenhaTextController.text.compareTo(senha) != 0) {
                  return 'As senhas precisam ser iguais';
                }
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _confirmarSenhaTextController,
              decoration: InputDecoration(hintText: 'Confirmar senha'),
              keyboardType: TextInputType.text,
              obscureText: true,
              validator: (confirmarSenha) {
                if (confirmarSenha.isEmpty || confirmarSenha.length < 6) {
                  return 'Campo obrigatorio e com no minimo 6 caracteres';
                }
                if (_senhaTextController.text.compareTo(confirmarSenha) != 0) {
                  return 'As senhas precisam ser iguais';
                }
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _descricaoTextController,
              decoration: InputDecoration(hintText: 'Descricao'),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text(
                'Salvar',
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  final mapDemaisDados = {
                    'nome': _nomeTextController.text,
                    'email': _emailTextController.text,
                    'descricao': _descricaoTextController.text
                  };
                  BlocProvider.getBloc<UsuarioBloc>().cadastrar(
                      _emailTextController.text,
                      _senhaTextController.text,
                      mapDemaisDados);
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
