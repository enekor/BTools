
import 'dart:convert';

BTools bToolsFromJson(String str) => BTools.fromJson(str);

String bToolsToJson(BTools data) => json.encode(data.toJson());

class BTools {
  List<Note> notes;
  List<Count> counts;
  List<ToDoItem> todos;

  BTools({
    required this.notes,
    required this.counts,
    required this.todos
  });

  factory BTools.fromJson(String jsonTxt) {
    if(jsonTxt == ""){
      return BTools(notes: [],counts: [], todos: []);
    }
    Map<String, dynamic> json = jsonDecode(jsonTxt);
    return BTools(
      notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
      counts: List<Count>.from(json["counts"].map((x) => Count.fromJson(x))),
      todos: List<ToDoItem>.from(json["todo"].map((x)=>ToDoItem.fromJson(x)))
    );
  }

  Map<String, dynamic> toJson() => {
    "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
    "counts": List<dynamic>.from(counts.map((x) => x.toJson())),
    "todos": List<dynamic>.from(todos.map((x)=>x.toJson()))
  };

  bool existsCountWithName(String name){
    List<String> names = counts.map((count)=>count.name).toList();
    return names.contains(name);
  }

  bool existsNoteWithName(String name){
    List<String> names = notes.map((note)=>note.title).toList();
    return names.contains(name);
  }

  void createNewCount(String name, String? image){
    counts.add(Count(name: name, value: 0, image: image??""));
  }

  void editCounter(String name, double value){
    counts.firstWhere((count) => count.name == name).value = value;
  }

  void editCounterImage(String name, String image){
    counts.firstWhere((count) => count.name == name).image = image;
  }

  void deleteCounter(String name){
    counts.removeWhere((count) => count.name == name);
  }

  void createNewNote(String title){
    notes.add(Note(title: title, body: ""));
  }

  void editNote(String title, String text){
    notes.firstWhere((note) => note.title == title).body = text;
  }

  void deleteNote(String title){
    notes.removeWhere((note) => note.title == title);
  }

  void createNewTodoItem(String title){
    todos.add(ToDoItem(title: title,id: todos.length));
  }

  void changeTodoItemChecked(int id){
    todos.firstWhere((todo) => todo.id==id).seleccionado = !todos.firstWhere((todo) => todo.id==id).seleccionado;
  }

  void deleteTodoItem(int id){
    todos.removeWhere((todo) => todo.id==id);
  }
}

class Count {
  String name;
  double value;
  String image;

  Count({
    required this.name,
    required this.value,
    required this.image,
  });

  factory Count.fromJson(Map<String, dynamic> json) => Count(
    name: json["name"],
    value: json["value"]?.toDouble(),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
    "image": image,
  };
}

class Note {
  String title;
  String body;

  Note({
    required this.title,
    required this.body,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
  };
}

class ToDoItem{
  String title;
  bool seleccionado;
  int id;

  ToDoItem({
    required this.title,
    this.seleccionado = false,
    required this.id
  });

  factory ToDoItem.fromJson(Map<String,dynamic> json)=> ToDoItem(
    title: json["title"],
    seleccionado:json["seleccionado"],
    id:json["id"]
  );

  Map<String,dynamic> toJson()=>{
    "title":title,
    "seleccionado":seleccionado,
    "id":id
  };

}
