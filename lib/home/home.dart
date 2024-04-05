import 'package:b_tools/viewWidgets/homeWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  RxInt _selected = 0.obs;

  void _onChangeSelected(int select){
    _selected.value = select;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
        bottomNavigationBar: bottomBar(onChange: _onChangeSelected, theme: Theme.of(context), actual: _selected.value),
        body: bodyShow(page: _selected.value)
      ),
    );
  }
}
