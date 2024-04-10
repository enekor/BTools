import 'package:b_tools/models/btools.dart';
import 'package:b_tools/utils/staticValues.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget contadorView({required Count count, required Function(Count) onTap, required Function(Count) onDelete, required Function(Count,int) add1}){
  return Card(
    margin: EdgeInsets.all(staticValues.innerCardItemsPadding),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(count.name),
        Text(count.value.toStringAsFixed(0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: ()=>add1(count,-1), icon: const Icon(Icons.remove)),
            IconButton(onPressed: ()=>add1(count,1), icon: const Icon(Icons.add))
          ],
        )
      ],
    ),
  );
}

TextEditingController nombre = TextEditingController();
void nuevoContador({required BuildContext context, required Function(String,String?) onCreate}){
  showDialog(context: context, builder: (context) => AlertDialog(
    title: const Text("Nuevo contador"),
    content: TextField(
      controller: nombre,
      decoration: InputDecoration(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/1.5),
        labelText: "Nombre"
      ),
    ),
    actions: [
      TextButton(onPressed: ()=>onCreate(nombre.text,null), child: const Text("Crear")),
      TextButton(onPressed: ()=>Navigator.pop(context), child: const Text("Cancelar"))
    ],
  ),);
}