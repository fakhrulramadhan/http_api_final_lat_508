import 'dart:convert';

import 'package:flutter/material.dart';
import './halaman/rumah.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Rumah(),
    );
  }
}
