// lib/main.dart

import 'package:flutter/material.dart';
import 'ui/interfaz.dart';  // Importamos la interfaz desde la carpeta 'ui'

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comprobador de Divisibilidad',
      theme: ThemeData(
        primarySwatch: Colors.teal, // Usamos un tema principal de color teal
        fontFamily: 'Roboto',  // Fuente moderna y clara
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Comprobación de Divisibilidad'),
    );
  }
}
