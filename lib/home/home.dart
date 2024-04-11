import 'package:b_tools/utils/data.dart';
import 'package:b_tools/viewWidgets/homeWidgets.dart';
import 'package:b_tools/views/contadores.dart';
import 'package:b_tools/views/notes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selected = 0;

  void _onChangeSelected(int select){
    setState(() {
      _selected = select;
    });
  }

  Widget bodyShow(){
    Widget ret = Container();
    
    if(_selected == 0){
      ret = const MainPageNotes();
    }
    else if(_selected == 1){
      ret = const MainPageContadores();
    }
  
    return ret;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        bottomNavigationBar: bottomBar(onChange: _onChangeSelected, theme: Theme.of(context), actual: _selected),
        body: FutureBuilder(
          future:BToolsData().initData(),
          builder: (context, snapshot) => snapshot.hasData
            ? bodyShow()
            : CircularProgressIndicator(color: Theme.of(context).primaryColor,),
        )
    );
  }
}
