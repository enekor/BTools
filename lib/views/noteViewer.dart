import 'package:b_tools/models/btools.dart';
import 'package:b_tools/utils/data.dart';
import 'package:b_tools/utils/staticValues.dart';
import 'package:flutter/material.dart';

late Note _note;
class NoteViewer extends StatefulWidget {
  NoteViewer({super.key, required Note note}){
    _note = note;
  }

  @override
  State<NoteViewer> createState() => _NoteViewerState();
}

Widget CDivider(){
  return Padding(
    padding: EdgeInsets.only(top:staticValues.innerCardItemsPadding,bottom: staticValues.innerCardItemsPadding),
    child: const Divider(),
  );
}
TextEditingController body = TextEditingController(text: _note.body);
class _NoteViewerState extends State<NoteViewer> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        appBar: AppBar(
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Center(child: Text(_note.title, style: Theme.of(context).textTheme.titleLarge))
          ),
        ),
        body: Padding(
          padding:EdgeInsets.only(top:staticValues.pagePadding,right: staticValues.pagePadding,left: staticValues.pagePadding),
          child: Center(child: Card.filled(
            child: Padding(
              padding: EdgeInsets.all(staticValues.pagePadding),
              child: Column(
                children: [
                  Expanded(
                    flex:10,
                    child: TextFormField(
                      controller: body,
                      maxLines: null, // Permite que el TextField tenga múltiples líneas
                      decoration: const InputDecoration(
                        hintText: 'Escribe aquí tu nota...',
                      ),
                      onChanged: (_)=>BToolsData().bTools.editNote(_note.title, body.text),
                    ),
                  ),
                ],
              ),
            ),
          ),),
        ),
      ),
    );
  }
}