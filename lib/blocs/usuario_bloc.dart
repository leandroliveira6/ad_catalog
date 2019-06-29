import 'package:ad_catalog/blocs/loja_bloc.dart';
import 'package:ad_catalog/blocs/processamento_bloc.dart';
import 'package:ad_catalog/models/loja.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class UsuarioBloc extends BlocBase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _processamentoBloc = BlocProvider.getBloc<ProcessamentoBloc>();

  FirebaseUser _firebaseUser;
  Loja _loja;

  Loja get obterLoja => _loja;

  UsuarioBloc() {
    print('Instancia de UsuarioBloc criada');
  }

  void logar({email, senha}) {
    if (email == null && senha == null) {
      _auth.currentUser().then((usuario) {
        print(usuario.uid);
        _firebaseUser = usuario;
        _receberUsuario(usuario);
      }, onError: (erro) {
        print(erro);
      });
    } else {
      _processamentoBloc.atualizarEstadoPara('processando');
      _auth
          .signInWithEmailAndPassword(email: email, password: senha)
          .then(_receberUsuario)
          .catchError(print);
    }
  }

  void cadastrar(email, senha, demaisDados) {
    _processamentoBloc.atualizarEstadoPara('processando');
    _auth
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((usuario) => _receberUsuario(usuario, demaisDados: demaisDados))
        .catchError(print);
  }

  void _receberUsuario(usuario, {demaisDados}) {
    final bloc = BlocProvider.getBloc<LojaBloc>();
    bloc.obterLojaCadastrada.listen((loja) {
      print('USUARIO BLOC: Instancia de Loja recebida');
      _loja = loja;
      _concluirProcessamento();
    });

    print('USUARIO BLOC: Usuario recebido');
    _firebaseUser = usuario;

    if (demaisDados != null) {
      print('USUARIO BLOC: Cadastrando loja');
      bloc.cadastrarLoja(_firebaseUser.uid, demaisDados);
    } else {
      print('USUARIO BLOC: Especificando loja');
      bloc.especificarLoja(_firebaseUser.uid, paraUsuario: true);
    }
    //onAuthStateChanged
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

  void _concluirProcessamento() {
    _processamentoBloc.atualizarEstadoPara('concluido');
  }

  void deslogar() async {
    _processamentoBloc.atualizarEstadoPara('processando');
    print('USUARIO BLOC: Deslogando');
    _auth.signOut().then((resultado) {
      print('USUARIO BLOC: Deslogou');
      _firebaseUser = null;
      _loja = null;

      print('USUARIO BLOC: Concluindo processamento');
    }).whenComplete(() {
      _concluirProcessamento();
      print('USUARIO BLOC: Processamento concluido');
    });
  }

  bool estaLogado() {
    return _firebaseUser != null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
