import 'package:b_tools/models/btools.dart';
import 'package:b_tools/utils/staticValues.dart';
import 'package:flutter/material.dart';

Widget noteView({required Function(String) onDelete, required Function(Note) onOpen, required Note note, required ThemeData theme}){
  return InkWell(
    onTap: ()=>onOpen(note),
    child: Card(
      child: Padding(
        padding: EdgeInsets.all(staticValues.insideCardPadding),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex:4,
                child: Padding(
                  padding: EdgeInsets.all(staticValues.innerCardItemsPadding),
                  child: Text(note.title, style: theme.textTheme.titleMedium,),
                )
              ),
              Expanded(
                flex:4,
                child: Padding(
                  padding: EdgeInsets.all(staticValues.innerCardItemsPadding),
                  child: note.body == ""
                    ? Text("Nota sin contenido")
                    : Text(note.body.length>15 ?"${note.body.substring(0,15)}..." : note.body)
                )
              ),
              Expanded(
                flex:2,
                child: Padding(
                  padding: EdgeInsets.all(staticValues.innerCardItemsPadding),
                  child: IconButton(onPressed: ()=>onDelete(note.title), icon: const Icon(Icons.delete)),
                )
              )
            ],
          ),
        ),
      ),
    ),
  );
}

void nuevaNotaView({required Function(String) onCreate, required BuildContext context}){
  TextEditingController _title = TextEditingController();

  showDialog(
    context: context, 
    builder: ((context)=>AlertDialog(
      title: const Text("Nueva nota"),
      content: TextField(
        autofocus: true,
        controller: _title,
        decoration: InputDecoration(
          labelText: "Título",
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/1.5)
        ),
      ),
      actions: [
        TextButton(onPressed: ()=>onCreate(_title.text), child: const Text("Crear")),
        TextButton(onPressed: ()=>Navigator.pop(context), child: const Text("Cancelar"))
      ],
    ))
  );
}