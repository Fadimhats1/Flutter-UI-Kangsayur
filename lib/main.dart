import 'package:flutter/material.dart';
import 'package:kangsayur_ui/controlPages.dart';
import 'package:kangsayur_ui/detailPage/detailPage.dart';
import 'package:kangsayur_ui/mainPage/mainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'inter',
      ),
      debugShowCheckedModeBanner: false,
      home: ControlPages(),
    );
  }
}
