import 'package:b_tools/viewWidgets/calculatorWidgets.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

String _x = '';
String _y = '';
String _calc = "";
String _head = "";
class _CalculatorState extends State<Calculator> {

  void _calculate(){
    setState(() {
      _head = '';
    });
  }
  void _onNumberPressed(String number){
    int num = int.parse(number);
    if(_calc == ""){
      _x += num.toString();
    }else{
      _y += num.toString();
    }

    _head += number.toString();
  }

  void _onCalcPressed(String calc){
    switch(calc){
      case '+-':
        if(double.tryParse(_head) != null){
          if(calc == ""){
            _x = _x.startsWith('-') ? _x.substring(1,_x.length-1) : "-$_x";
          }
          else{
            _y = _y.startsWith('-') ? _y.substring(1,_y.length-1) : "-$_y";
          }
          _head = _head.startsWith('-') ? _head.substring(1,_x.length-1) : "-$_head";
        }
        break;
      case '+':
      case '-':
      case 'X':
      case '/':
      case '%':
        _calc = calc;
        _head = calc;
        break;
      case ',':
        if(double.tryParse(_head) != null){
          if(calc == ""){
            _x = _x.contains(',') ? _x : "$_x,";
          }
          else{
            _y = _y.contains(',') ? _y : "$_y,";
          }
          _head = _head.contains(',') ? _head : "$_head,";
        }
        break;
      case '=':
        _calculate();
        break;
      case 'root':
      case 'sin':
      case 'cos':
      case 'tan':
        _calc = calc;
        _calculate;
    }

    setState(){}
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: Scaffold(
          appBar: AppBar(title: Text(_head)),
          body: Center(
            child: Card.filled(
              child: calculatorBody(onNumberPressed: _onNumberPressed, onCalcPressed: _onCalcPressed)
            ),
          ),
        )
    );
  }
}
