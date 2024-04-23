import 'package:b_tools/models/btools.dart';
import 'package:b_tools/utils/staticValues.dart';
import 'package:flutter/material.dart';

Widget todoItemView({required ToDoItem todo, required Function(int) onCheck, required Function(int) onDelete}){
  return Padding(
    padding: EdgeInsets.all(staticValues.insideCardPadding),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              flex:1,
              child: Checkbox(value: todo.seleccionado, onChanged: (_)=>onCheck(todo.id))
            ),
            Expanded(
              flex:9,
              child: Center(child: Text(
                todo.title,
                style: TextStyle(
                  decoration: todo.seleccionado
                  ?TextDecoration.lineThrough
                  :TextDecoration.none
                ),
              ))
            )
          ],
        ),
        const Divider()
      ],
    ),
  );
}

void newTodoItem({required Function(String) onCreate, required BuildContext context}){
  TextEditingController _title = TextEditingController();

  showDialog(
    context: context, 
    builder: ((context)=>AlertDialog(
      title: const Text("Nueva tarea"),
      content: TextField(
        autofocus: true,
        controller: _title,
        decoration: InputDecoration(
          labelText: "Def. tarea",
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