import 'package:b_tools/models/btools.dart';
import 'package:b_tools/utils/data.dart';
import 'package:b_tools/utils/staticValues.dart';
import 'package:b_tools/utils/toast.dart';
import 'package:b_tools/viewWidgets/notesWidgets.dart';
import 'package:b_tools/views/noteViewer.dart';
import 'package:flutter/material.dart';

class MainPageNotes extends StatefulWidget {
  const MainPageNotes({super.key});

  @override
  State<MainPageNotes> createState() => _MainPAgeNotesState();
}

class _MainPAgeNotesState extends State<MainPageNotes> {
  void _newNote(String title){
    if(BToolsData().bTools.existsNoteWithName(title)){
      showToast(text: "Ya existe una nota con ese título");
    }else{
      setState(() {
        BToolsData().bTools.createNewNote(title);
      });
      Navigator.pop(context);
      BToolsData().writeData();
    }
  }

  void _deleteNote(String title){
    setState(() {
      BToolsData().bTools.deleteNote(title);
    });
    BToolsData().writeData();
  }

  void _onOpenNote(Note note){
    Navigator.push(context, MaterialPageRoute(builder: (context) => NoteViewer(note: note))).then((_) => setState((){}));
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
              onOpen: _onOpenNote, 
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