import 'dart:io';

import 'package:b_tools/models/btools.dart';
import 'package:b_tools/utils/data.dart';
import 'package:b_tools/utils/imagePicker.dart';
import 'package:b_tools/utils/staticValues.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

late Count _count;
class ContadorViewer extends StatefulWidget {
  ContadorViewer({super.key, required Count count}){
    _count = count;
  }

  @override
  State<ContadorViewer> createState() => _ContadorViewerState();
}

TextEditingController _valor = TextEditingController(text: '1');
bool _editarValor = false;
class _ContadorViewerState extends State<ContadorViewer> {
  @override
  Widget build(BuildContext context) {

    Future _onImageChange()async{
      String ruta = await imagePicker.pickImage();
      setState(() {
        BToolsData().bTools.editCounterImage(_count.name, ruta);
        _count.image = ruta;
      });
      BToolsData().writeData();
    }

    void onCountChange(double add){
      setState(() {
        BToolsData().bTools.counts.firstWhere((count) => count.name == _count.name).value += add;
      });
      BToolsData().writeData();
    }

    return PopScope(
      child: Scaffold(
        appBar: AppBar(title: Text(_count.name),),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(staticValues.pagePadding),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   GestureDetector(
                    onTap: _onImageChange,
                    child:  _count.image == ""
                      ? const Icon(Icons.no_photography, size: 200,)
                      : Image.file(File(_count.image),height: 100,width: 100,),
                   ),
                    Text(_count.value.toStringAsFixed(0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex:4,
                          child: IconButton(onPressed: ()=>onCountChange(-1*double.parse(_valor.text)), icon: const Icon(Icons.remove))
                        ),
                       Expanded(
                        flex:2,
                        child:  _editarValor
                          ? TextFormField(
                            controller: _valor,
                            keyboardType: TextInputType.number,
                            autofocus: true,
                            onTapOutside: (_)=>changeEditarValor(false),
                          )
                          : TextButton(onPressed: ()=>changeEditarValor(true), child: Text(_valor.text)),
                       ),
                        Expanded(
                          flex:4,
                          child: IconButton(onPressed: ()=>onCountChange(double.parse(_valor.text)), icon: const Icon(Icons.add))
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changeEditarValor(bool nuevovalor)=>setState(() {
    _editarValor = nuevovalor;
  });
}