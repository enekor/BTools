import 'package:b_tools/utils/data.dart';
import 'package:b_tools/utils/staticValues.dart';
import 'package:b_tools/viewWidgets/notesWidgets.dart';
import 'package:flutter/material.dart';

class MainPageNotes extends StatefulWidget {
  const MainPageNotes({super.key});

  @override
  State<MainPageNotes> createState() => _MainPAgeNotesState();
}

class _MainPAgeNotesState extends State<MainPageNotes> {
  void _newNote(String title){
    setState(() {
      BToolsData().bTools.createNewNote(title);
    });
    Navigator.pop(context);
    BToolsData().writeData();
  }

  void _editNote(String title, String text){
    setState(() {
      BToolsData().bTools.editNote(title, text);
    });
    BToolsData().writeData();
  }

  void _deleteNote(String title){
    setState(() {
      BToolsData().bTools.deleteNote(title);
    });
    BToolsData().writeData();
  }

  void _onOpenNote(String title){
    
  }
  @override
  Widget build(BuildContext context) {

  return Scaffold(
    floatingActionButton: FloatingActionButton.extended(
      onPressed: ()=>nuevaNotaView(onCreate: _newNote,context: context),
      label: const Text('Nueva nota'),
      icon: const Icon(Icons.add),
      
    ),
    body: Padding(
      padding: EdgeInsets.all(staticValues.pagePadding),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: BToolsData().bTools.notes.map(
            (note) => noteView(
              onDelete: _deleteNote, 
              onOpen: _deleteNote, 
              note: note, 
              theme: Theme.of(context)
            )).toList(),
          ),
        ),
      ),
    ),
  );
  }
}