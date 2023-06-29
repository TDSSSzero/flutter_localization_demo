import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLanguage(BuildContext context,Locale locale){
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.changeLanguage(locale);
  }

}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Locale _locale = window.locale;

  changeLanguage(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('zh'),
        Locale('es'),
      ],
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'tdsss l10n test'),
    );
  }

  //localization

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(AppLocalizations.of(context)!.helloWorld),
            Text(AppLocalizations.of(context)!.name("雨矢逐天狼")),
            Text(AppLocalizations.of(context)!.players(1)),
            Text(AppLocalizations.of(context)!.players(0)),
            Text(AppLocalizations.of(context)!.pronoun('male')),
            Text(AppLocalizations.of(context)!.pronoun('asd')),
            ElevatedButton(onPressed: ()=>MyApp.setLanguage(context, const Locale('zh')), child: const Text("中文")),
            ElevatedButton(onPressed: ()=>MyApp.setLanguage(context, const Locale('en')), child: const Text("English"))
          ],
        ),
      ),
    );
  }
}
