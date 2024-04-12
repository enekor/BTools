import 'dart:io';

import 'package:b_tools/models/btools.dart';
import 'package:b_tools/utils/staticValues.dart';
import 'package:flutter/material.dart';

Widget contadorView({required Count count, required Function(Count) onTap, required Function(Count) onDelete, required Function(Count,int) add1, required BuildContext context}){
  return InkWell(
    onTap: ()=>onTap(count),
    onLongPress: ()=>deleteDialog(onDelete: onDelete,context: context,count: count),
    child: Card(
      margin: EdgeInsets.all(staticValues.innerCardItemsPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(count.name),
          count.image != ""
            ?Image.file(File(count.image),height: 50,width: 50,)
            :Icon(Icons.no_photography,size:50), 
          Text(count.value.toStringAsFixed(0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: ()=>add1(count,-1), icon: const Icon(Icons.remove)),
              IconButton(onPressed: ()=>add1(count,1), icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
    ),
  );
}

TextEditingController nombre = TextEditingController();
void nuevoContador({required BuildContext context, required Function(String,String?) onCreate}){
  showDialog(context: context, builder: (context) => AlertDialog(
    title: const Text("Nuevo contador"),
    content: TextField(
      autofocus: true,
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

void deleteDialog({required Function(Count) onDelete, required BuildContext context, required Count count}){
  showDialog(context: context, builder: (context)=>AlertDialog(
    title: const Text('Borrar contador'),
    content: Text('Desea borrar ${count.name}'),
    actions: [
      TextButton(onPressed: ()=>onDelete(count), child: const Text('Borrar')),
      TextButton(onPressed: ()=>Navigator.pop(context), child: const Text('Cancelar'))
    ],
  ));
}