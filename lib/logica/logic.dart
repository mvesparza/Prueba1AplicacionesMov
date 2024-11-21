// lib/logic/logic.dart

bool esDivisible(int numero1, int numero2) {
  // Verifica si el segundo número es divisible por el primero
  return numero1 % numero2 == 0;
}

double calcularDivision(int numero1, int numero2) {
  // Devuelve el resultado de la división, se maneja división por cero
  if (numero2 != 0) {
    return numero1 / numero2;
  }
  return double.infinity;  // Retorna infinito en caso de división por cero
}
