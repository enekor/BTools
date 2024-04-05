import 'package:b_tools/home/home.dart';
import 'package:b_tools/models/btools.dart';
import 'package:b_tools/utils/mainJsonManager.dart';
import 'package:flutter/material.dart';

Future main() async{
  BTools btools = bToolsFromJson(await readFromMainJson());
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
          useMaterial3: true,
      ),
      home: Home()
    )
  );
}
