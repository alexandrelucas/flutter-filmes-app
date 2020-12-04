import 'package:flutter/material.dart';
import 'package:filmesApp/pages/home_page.dart';
import 'package:filmesApp/core/constants.dart';

void main() {
  runApp(FilmesApp());
}

class FilmesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: app_name,
      theme: ThemeData(primarySwatch: Colors.red, brightness: Brightness.dark),
      home: HomePage(),
    );
  }
}
