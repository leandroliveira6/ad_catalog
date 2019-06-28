import 'package:ad_catalog/views/login_view.dart';
import 'package:flutter/material.dart';

class OpcoesPublicasWidget extends StatelessWidget {
  const OpcoesPublicasWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("Login"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
            },
          ),
        ],
      ),
    );
  }
}
