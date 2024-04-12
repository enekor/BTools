import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget calculatorBody({required Function(String) onNumberPressed, required Function(String) onCalcPressed}){
  return Column(
    children: [
      Expanded(
        flex: 1,
        child: Row(
          children: [],
        ),
      ),
      Expanded(
        flex:1,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: calculatorButton(text: Text('SIN'), onTap: onCalcPressed('sin')),
            ),
            Expanded(
              flex: 2,
              child: calculatorButton(text: Text('COS'), onTap: onCalcPressed('cos')),
            ),
            Expanded(
              flex: 2,
              child: calculatorButton(text: Text('TAN'), onTap: onCalcPressed('tan')),
            ),
            Expanded(
              flex: 2,
              child: calculatorButton(text: FaIcon(FontAwesomeIcons.squareRootVariable), onTap: onCalcPressed('root')),
            ),
            Expanded(
              flex: 2,
              child: calculatorButton(text: FaIcon(FontAwesomeIcons.superscript), onTap: onCalcPressed('super')),
            ),

          ],
        ),
      ),
      Expanded(
        flex:2,
        child: Row(
          children: [
            Expanded(
              flex:2,
              child: calculatorButton(text: Text("7"), onTap: ()=>onNumberPressed('7')),
            ),
            Expanded(
              flex:2,
              child: calculatorButton(text: Text("8"), onTap: ()=>onNumberPressed('8')),
            ),
            Expanded(
              flex:2,
              child: calculatorButton(text: Text("9"), onTap: ()=>onNumberPressed('9')),
            ),
            Expanded(
              flex: 2,
              child: calculatorButton(text: Text('C'), onTap: ()=>onCalcPressed('C')),
            ),
            Expanded(
              flex: 2,
              child: calculatorButton(text: Text('%'), onTap: ()=>onCalcPressed('%')),
            ),
          ],
        ),
      ),
      Expanded(
        flex:2,
        child: Row(
          children: [
            Expanded(
              flex:2,
              child: calculatorButton(text: Text("4"), onTap: ()=>onNumberPressed('4')),
            ),
            Expanded(
              flex:2,
              child: calculatorButton(text: Text("5"), onTap: ()=>onNumberPressed('5')),
            ),
            Expanded(
              flex:2,
              child: calculatorButton(text: Text("6"), onTap: ()=>onNumberPressed('6')),
            ),
            Expanded(
              flex: 2,
              child: calculatorButton(text: Text('+'), onTap: ()=>onCalcPressed('+')),
            ),
            Expanded(
              flex: 2,
              child: calculatorButton(text: Text('-'), onTap: ()=>onCalcPressed('-')),
            ),
          ],
        ),
      ),
      Expanded(
        flex:2,
        child: Row(
          children: [
            Expanded(
              flex:2,
              child: calculatorButton(text: Text("1"), onTap: ()=>onNumberPressed('1')),
            ),
            Expanded(
              flex:2,
              child: calculatorButton(text: Text("2"), onTap: ()=>onNumberPressed('2')),
            ),
            Expanded(
              flex:2,
              child: calculatorButton(text: Text("3"), onTap: ()=>onNumberPressed('3')),
            ),
            Expanded(
              flex: 2,
              child: calculatorButton(text: Text('X'), onTap: ()=>onCalcPressed('X')),
            ),
            Expanded(
              flex: 2,
              child: calculatorButton(text: Text('/'), onTap: ()=>onCalcPressed('/')),
            ),
          ],
        ),
      ),
      Expanded(
        flex:2,
        child: Row(
          children: [
            Expanded(
              flex:2,
              child: calculatorButton(text: Text(","), onTap: ()=>onNumberPressed(',')),
            ),
            Expanded(
              flex:2,
              child: calculatorButton(text: Text("0"), onTap: ()=>onNumberPressed('0')),
            ),
            Expanded(
              flex:2,
              child: calculatorButton(text: FaIcon(FontAwesomeIcons.plusMinus), onTap: ()=>onNumberPressed('+-')),
            ),
            Expanded(
              flex: 4,
              child: calculatorButton(text: Text('='), onTap: ()=>onCalcPressed('=')),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget calculatorButton({required Widget text, required Function onTap}){
  return InkWell(
    onTap: ()=>onTap(),
    child: Card(
      child: Center(
        child: text,
      ),
    ),
  );
}