import 'dart:async';

import 'package:ad_catalog/blocs/loja_bloc.dart';
import 'package:ad_catalog/blocs/processamento_bloc.dart';
import 'package:ad_catalog/models/loja.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class UsuarioBloc extends BlocBase {
  //final _usuarioController = StreamController<String>.broadcast();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _processamentoBloc = BlocProvider.getBloc<ProcessamentoBloc>();

  FirebaseUser _firebaseUser;
  Loja _loja;

  //Stream get atualizacaoUsuario => _usuarioController.stream;

  UsuarioBloc() {
    print('Instancia de UsuarioBloc criada');
  }

  void logar(email, senha) async {
    _processamentoBloc.atualizarEstadoPara('processando');
    _auth
        .signInWithEmailAndPassword(email: email, password: senha)
        .then(_receberUsuario)
        .catchError(_erroEncontrado)
        .whenComplete(_concluirProcessamento);
  }

  void cadastrar(email, senha, demaisDados) async {
    _processamentoBloc.atualizarEstadoPara('processando');
    _auth
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((usuario) => _receberUsuario(usuario, demaisDados: demaisDados))
        .catchError(_erroEncontrado);
  }

  void _receberUsuario(usuario, {demaisDados}) async {
    _firebaseUser = usuario;
    if (demaisDados != null) {
      final bloc = BlocProvider.getBloc<LojaBloc>();
      bloc.cadastrarLoja(_firebaseUser.uid, demaisDados);
      final subscription = bloc.obterLoja.listen(null);
      subscription.onData((loja){
        print('USUARIO BLOC: Instancia de Loja recebida');
        _loja = loja;
        subscription.cancel();
        _concluirProcessamento();
      });
      /*
      StreamSubscription subscription = bloc.obterLoja.listen(null);
      subscription.onData((loja){
        print('Chamou o listen da loja');
        _loja = loja;
        subscription.cancel();
      });
      */
    }
    //onAuthStateChanged
  }

  void _erroEncontrado(erro) {
    print(erro);
  }

  void _concluirProcessamento() {
    _processamentoBloc.atualizarEstadoPara('concluido');
  }

  /*
  Errors:
  ERROR_INVALID_EMAIL - If the [email] address is malformed.
  ERROR_WRONG_PASSWORD - If the [password] is wrong.
  ERROR_USER_NOT_FOUND - If there is no user corresponding to the given [email] address, or if the user has been deleted.
  ERROR_USER_DISABLED - If the user has been disabled (for example, in the Firebase console)
  ERROR_TOO_MANY_REQUESTS - If there was too many attempts to sign in as this user.
  ERROR_OPERATION_NOT_ALLOWED - Indicates that Email & Password accounts are not enabled.
   */

  void deslogar() async {
    _processamentoBloc.atualizarEstadoPara('processando');

    Future.delayed(Duration(seconds: 2)).then((resultado) {
      _processamentoBloc.atualizarEstadoPara('concluido');
    });
  }

  void obterIdUsuario() {}

  @override
  void dispose() {
    //_usuarioController.close();
    super.dispose();
  }
}
