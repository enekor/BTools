import 'package:b_tools/models/btools.dart';
import 'package:b_tools/utils/data.dart';
import 'package:b_tools/utils/toast.dart';
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
    if(BToolsData().bTools.existsCountWithName(name)){
      showToast(text: "Ya existe un contador con ese nombre");
    }else{
      setState(() {
        BToolsData().bTools.createNewCount(name, image);
      });
      BToolsData().writeData();
      Navigator.pop(context);
    }
    
  }

  void _deleteCount(Count count){
    setState(() {
      BToolsData().bTools.deleteCounter(count.name);
    });
    Navigator.pop(context);
    BToolsData().writeData();
  }

  void _add1(Count count, int num){
    setState(() {
      BToolsData().bTools.counts.firstWhere((c) => c.name == count.name).value += num;
    });
    BToolsData().writeData();
  }

  void _onNavigate(Count count){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ContadorViewer(count:count))).then((_) => setState((){}));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(onPressed: ()=>nuevoContador(context: context,onCreate: _newCount),icon: const Icon(Icons.add),label: const Text("Nuevo contador"),),
        body: Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: BToolsData().bTools.counts.map((count) => contadorView(count: count, onTap: _onNavigate, onDelete: _deleteCount, add1: _add1, context: context)).toList()
          ),
        ),
      )
    );
  }
}