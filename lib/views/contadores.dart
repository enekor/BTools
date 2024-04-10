import 'package:b_tools/models/btools.dart';
import 'package:b_tools/utils/data.dart';
import 'package:b_tools/viewWidgets/contadoresWidgets.dart';
import 'package:b_tools/views/contadorViewer.dart';
import 'package:flutter/material.dart';

class MainPageContadores extends StatefulWidget {
  const MainPageContadores({super.key});

  @override
  State<MainPageContadores> createState() => _MainPageContadoresState();
}

class _MainPageContadoresState extends State<MainPageContadores> {
  void _newCount(String name, String? image){
    setState(() {
      BToolsData().bTools.createNewCount(name, image);
    });
    Navigator.pop(context);
  }

  void _editCount(String name, double value){
    setState(() {
      BToolsData().bTools.editCounter(name, value);
    });
  }

  void _editCountImage(String name, String image){
    setState(() {
      BToolsData().bTools.editCounterImage(name, image);
    });
  }

  void _deleteCount(Count count){
    setState(() {
      BToolsData().bTools.deleteCounter(count.name);
    });
  }

  void _add1(Count count, int num){
    setState(() {
      BToolsData().bTools.counts.firstWhere((c) => c.name == count.name).value += num;
    });
  }

  void _onNavigate(Count count){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ContadorViewer(count:count)));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(onPressed: ()=>nuevoContador(context: context,onCreate: _newCount),icon: const Icon(Icons.add),label: const Text("Nuevo contador"),),
        body: Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: BToolsData().bTools.counts.map((count) => contadorView(count: count, onTap: _onNavigate, onDelete: _deleteCount, add1: _add1)).toList()
          ),
        ),
      )
    );
  }
}