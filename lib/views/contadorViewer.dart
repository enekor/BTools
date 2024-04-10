import 'package:b_tools/models/btools.dart';
import 'package:flutter/material.dart';
late Count _count;
class ContadorViewer extends StatefulWidget {
  ContadorViewer({super.key, required Count count}){
    _count = count;
  }

  @override
  State<ContadorViewer> createState() => _ContadorViewerState();
}

class _ContadorViewerState extends State<ContadorViewer> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}