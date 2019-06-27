import 'package:ad_catalog/blocs/localizations_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';

class RodapeWidget extends StatelessWidget {
  const RodapeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<LocalizationsBloc>();
    final idiomas = ['br', 'us', 'es'];

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              bloc.alterarIdiomaPara('pt');
              Navigator.pop(context);
            },
            padding: EdgeInsets.all(0.0),
            child: CountryPickerUtils.getDefaultFlagImage(
              Country.fromMap({'isoCode': idiomas[0]}),
            ),
          ),
          FlatButton(
            onPressed: () {
              bloc.alterarIdiomaPara('en');
              Navigator.pop(context);
            },
            padding: EdgeInsets.all(0.0),
            child: CountryPickerUtils.getDefaultFlagImage(
              Country.fromMap({'isoCode': idiomas[1]}),
            ),
          ),
          FlatButton(
            onPressed: () {
              bloc.alterarIdiomaPara('es');
              Navigator.pop(context);
            },
            padding: EdgeInsets.all(0.0),
            child: CountryPickerUtils.getDefaultFlagImage(
              Country.fromMap({'isoCode': idiomas[2]}),
            ),
          ),
        ],
      ),
    );
  }
}
