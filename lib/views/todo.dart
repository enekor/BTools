import 'package:b_tools/utils/data.dart';
import 'package:b_tools/utils/staticValues.dart';
import 'package:b_tools/viewWidgets/todoWidgets.dart';
import 'package:flutter/material.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  bool checked = false;

  void _changeChecked(){
    setState(() {
      checked = !checked;
    });
    BToolsData().writeData();
  }
  void _onCreate(String title){
    setState(() {
      BToolsData().bTools.createNewTodoItem(title);
    });

    Navigator.pop(context);
    BToolsData().writeData();
  }

  void _onDelete(int id){
    setState(() {
      BToolsData().bTools.deleteTodoItem(id);
    });
      BToolsData().writeData();
  }

  void _onCheck(int id){
    setState(() {
      BToolsData().bTools.changeTodoItemChecked(id);
    });
    BToolsData().writeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=>newTodoItem(context: context,onCreate: _onCreate),
        icon: const Icon(Icons.add),
        label: const Text('Nueva tarea'),
      ),
      body: Padding(
        padding: EdgeInsets.all(staticValues.pagePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                TextButton(onPressed: _changeChecked, child: const Text("Ver completados")),
                Switch(value: checked, onChanged: (_)=>_changeChecked()),
              ],
            ),
            Expanded(
              child: BToolsData().bTools.todos.isEmpty
                ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cancel_outlined),
                    Text("No hay tareas actualmente")
                  ],
                )
                : Card.filled(
                    child: ListView.builder(
                    itemCount: BToolsData().bTools.todos.where((todo) => todo.seleccionado == checked).length,
                    itemBuilder: (BuildContext context, int index) {
                      return todoItemView(todo: BToolsData().bTools.todos.where((todo) => todo.seleccionado == checked).toList()[index], onCheck: _onCheck, onDelete: _onDelete);
                    },
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}