import 'dart:io';

import 'package:flutter/material.dart';
import 'package:oauth2_test/my_home_page.dart';

class ApplicationHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (_, __, ___) => true;
  }
}

void main() {
  HttpOverrides.global = ApplicationHttpOverrides();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter with OAuth 2'),
    );
  }
}
