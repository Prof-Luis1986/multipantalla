import 'package:flutter/material.dart';
import 'home_screen.dart'; // Importa la pantalla de inicio

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Multi-Screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // Establece la pantalla de inicio
    );
  }
}
