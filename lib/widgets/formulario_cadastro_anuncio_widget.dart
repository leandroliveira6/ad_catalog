import 'package:ad_catalog/blocs/anuncios_bloc.dart';
import 'package:ad_catalog/blocs/usuario_bloc.dart';
import 'package:ad_catalog/views/processamento_view.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class FormularioCadastroAnuncioWidget extends StatefulWidget {
  FormularioCadastroAnuncioWidget({Key key}) : super(key: key);

  _FormularioCadastroAnuncioWidgetState createState() =>
      _FormularioCadastroAnuncioWidgetState();
}

class _FormularioCadastroAnuncioWidgetState
    extends State<FormularioCadastroAnuncioWidget> {
  final _formKey = GlobalKey<FormState>();
  final _categoriaTextController = TextEditingController();
  final _marcaTextController = TextEditingController();
  final _modeloTextController = TextEditingController();
  final _valorTextController = TextEditingController();
  final _descricaoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _categoriaTextController,
              decoration: InputDecoration(hintText: 'Categoria'),
              keyboardType: TextInputType.text,
              validator: (nome) {
                if (nome.isEmpty || nome.length < 3) return 'Campo obrigatorio';
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _marcaTextController,
              decoration: InputDecoration(hintText: 'Marca'),
              keyboardType: TextInputType.text,
              validator: (nome) {
                if (nome.isEmpty || nome.length < 3) return 'Campo obrigatorio';
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _modeloTextController,
              decoration: InputDecoration(hintText: 'Modelo'),
              keyboardType: TextInputType.text,
              validator: (nome) {
                if (nome.isEmpty || nome.length < 3) return 'Campo obrigatorio';
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _valorTextController,
              decoration: InputDecoration(hintText: 'Valor'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              validator: (valor) {
                if (valor.isEmpty) return 'Campo obrigatorio';
                if(double.tryParse(valor) == null) return 'O valor deve conter no maximo 1 ponto.';
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _descricaoTextController,
              decoration: InputDecoration(hintText: 'Descricao'),
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('Salvar'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  final loja = BlocProvider.getBloc<UsuarioBloc>().obterLoja;

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProcessamentoView()));
                  BlocProvider.getBloc<AnunciosBloc>().cadastrarAnuncio({
                    'idLoja': loja.id,
                    'nomeLoja': loja.nome,
                    'categoria': _categoriaTextController.text,
                    'marca': _marcaTextController.text,
                    'modelo': _modeloTextController.text,
                    'valor': double.parse(_valorTextController.text.replaceFirst(',', '.')),
                    'descricao': _descricaoTextController.text,
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
