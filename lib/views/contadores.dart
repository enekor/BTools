import 'package:b_tools/utils/data.dart';
import 'package:flutter/material.dart';

class MainPageContadores extends StatefulWidget {
  const MainPageContadores({super.key});

  @override
  State<MainPageContadores> createState() => _MainPageContadoresState();
}

class _MainPageContadoresState extends State<MainPageContadores> {
  void _newCount(String name, String? image){
    BToolsData().bTools.createNewCount(name, image);
  }

  void _editCount(String name, double value){
    BToolsData().bTools.editCounter(name, value);
  }

  void _editCountImage(String name, String image){
    BToolsData().bTools.editCounterImage(name, image);
  }

  void _deleteCount(String name){
    BToolsData().bTools.deleteCounter(name);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Estas en contadores, hola ${BToolsData().bTools.counts.length}"),
    );
  }
}