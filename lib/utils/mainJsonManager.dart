
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:b_tools/models/btools.dart';


Future<String> readFromMainJson() async{
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  String json = "";

  if(await File("${appDocumentsDir.path}/btools.json").exists()){
    json = await File("${appDocumentsDir.path}/btools.json").readAsString();
  }
  else{
    BTools t = BTools(counts: [],notes: []);
    json = jsonEncode(t.toJson());
    await File("${appDocumentsDir.path}/btools.json").create();
  }

  return json;
}

Future writeToMainJson(BTools btools) async{
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
  String json = jsonEncode(btools.toJson());
  
  await File("${appDocumentsDir.path}/btools.json").writeAsString(json);

}