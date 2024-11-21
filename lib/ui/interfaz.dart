// lib/ui/interfaz.dart

import 'package:flutter/material.dart';
import '../logica/logic.dart';  // Importamos la lógica desde la carpeta 'logic'

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String resultMessage = '';
  String divisionResult = '';

  void _calcularDivisibilidad() {
    int num1 = int.tryParse(num1Controller.text) ?? 0;
    int num2 = int.tryParse(num2Controller.text) ?? 0;

    setState(() {
      // Comprobamos si es divisible
      if (esDivisible(num1, num2)) {
        resultMessage = '¡Éxito! $num2 es divisible por $num1';
      } else {
        resultMessage = 'Lo siento, $num2 NO es divisible por $num1';
      }

      // Calculamos la división
      double division = calcularDivision(num1, num2);
      if (division == double.infinity) {
        divisionResult = 'No se puede dividir por cero';
      } else {
        divisionResult = 'El resultado de la división es: ${division.toStringAsFixed(2)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],  // Fondo suave
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.teal,  // Color de barra superior
        elevation: 0,  // Eliminar sombra para un look más limpio
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Título
            Text(
              'Verifica la divisibilidad',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
            const SizedBox(height: 30),

            // Campos de texto
            TextField(
              controller: num1Controller,
              decoration: InputDecoration(
                labelText: 'Primer número',
                labelStyle: TextStyle(color: Colors.teal),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: num2Controller,
              decoration: InputDecoration(
                labelText: 'Segundo número',
                labelStyle: TextStyle(color: Colors.teal),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2.0),
                ),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),

            // Botón de acción
            ElevatedButton(
              onPressed: _calcularDivisibilidad,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Usamos el parámetro 'backgroundColor' en lugar de 'primary'
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 5,
              ),
              child: Text(
                'Comprobar divisibilidad',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),

            // Resultados
            Text(
              resultMessage,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: resultMessage.contains("NO") ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              divisionResult,
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
