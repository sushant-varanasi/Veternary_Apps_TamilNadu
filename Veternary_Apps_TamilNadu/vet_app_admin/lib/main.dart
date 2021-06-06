import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetappadmin/adminsclass.dart';
import 'package:vetappadmin/wrapper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'locale/app_localization.dart';
import 'package:intl/intl.dart';


import 'auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppLocalizationDelegate _localeOverrideDelegate =
  AppLocalizationDelegate(Locale('en', 'US'));
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Admin>.value(
        value: AuthService().admin,
        child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            _localeOverrideDelegate
          ], supportedLocales: [
          const Locale('en', 'US'),
          const Locale('de', 'DE')
        ],
          title: 'Vet App Admin',
          theme: ThemeData(
            primarySwatch: Colors.yellow,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: wrapper(),

        ));
  }

}