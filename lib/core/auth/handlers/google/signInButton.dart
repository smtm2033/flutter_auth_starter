import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_auth_base/flutter_auth_base.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';

import '../../../common/actionable.dart';

Future signInAction(AuthProvider provider, Actionable actionable) async {
  await actionable.performAction((BuildContext context) async {
    await provider.signIn(new Map<String, String>());

    //Navigator.of(context).pushNamedAndRemoveUntil('/home', (item) => false);
    // new Future.delayed(
    //     const Duration(seconds: 0),
    //     () => Navigator
    //         .of(context)
    //         .pushNamedAndRemoveUntil('/home', (item) => false));
  });
}

class SignInButton extends StatelessWidget {
  SignInButton({@required this.provider, @required this.actionable});

  final AuthProvider provider;
  final Actionable actionable;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.red,
      padding: EdgeInsets.all(8.0),
      onPressed: () async => await signInAction(provider, actionable),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.google,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Text('Google Sign in', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}