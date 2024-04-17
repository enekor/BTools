
import 'dart:math';

double Calculate(double n1, double n2, String calc){

  switch(calc){
    case "sin":
      return _seno(n1);
    case "cos":
      return _coseno(n1);
    case "tan":
      return _tangente(n1);
    case "root":
      return _raizCuadrada(n1);
    case "super":
      return _elevar(n1, n2);
    case "%":
      return _resto(n1, n2);
    case "+":
      return _sumar(n1, n2);
    case "-":
      return _restar(n1, n2);
    case "X":
      return _multiplicar(n1, n2);
    case "/":
      return _dividir(n1, n2);
    default:
      return 0;
    
  }
}

double _sumar(double n1, double n2){
  return n1+n2;
}
double _restar(double n1, double n2){
  return n1-n2;
}
double _multiplicar(double n1, double n2){
  return n1*n2;
}
double _dividir(double n1, double n2){
  return n1/n2;
}
double _resto(double n1, double n2){
  return n1%n2;
}
double _seno(double n1){
  return sin(n1);
}
double _coseno(double n1){
  return cos(n1);
}
double _tangente(double n1){
  return tan(n1);
}
double _raizCuadrada(double n1){
  return sqrt(n1);
}
double _elevar(double n1, double n2){
  return pow(n1, n2).toDouble();
}



