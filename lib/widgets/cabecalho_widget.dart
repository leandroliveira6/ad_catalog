import 'package:ad_catalog/blocs/sidebar_bloc.dart';
import 'package:ad_catalog/delegates/localizations_deletage.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class CabecalhoWidget extends StatelessWidget {
  const CabecalhoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: UserAccountsDrawerHeader(
        onDetailsPressed: () {
          BlocProvider.getBloc<SidebarBloc>().trocarCorpo();
        },
        currentAccountPicture: CircleAvatar(
          child: Icon(
            Icons.person,
            size: 40,
          ),
        ),
        otherAccountsPictures: <Widget>[
          Icon(
            Icons.offline_pin,
            color: Colors.green,
          ),
        ],
        accountName: Text(DemoLocalizations.of(context).hello),
        accountEmail: Text(DemoLocalizations.of(context).options),
        decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))),
      ),
    );
  }
}
