import 'package:ad_catalog/views/login_view.dart';
import 'package:flutter/material.dart';

class OpcoesPublicasWidget extends StatelessWidget {
  const OpcoesPublicasWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('COMPILANDO WIDGET DE OPCOES PUBLICAS');
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: ListTile(
              title: Text("Login",
                  style: TextStyle(fontSize: 20, color: Colors.black54)),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginView()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
