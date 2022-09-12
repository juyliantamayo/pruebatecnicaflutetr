import 'package:flutter/material.dart';
import 'package:pruebatecnicaflutetr/Pages/home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
        useMaterial3: true
      ),
      home: Home(),
    );
  }
}

