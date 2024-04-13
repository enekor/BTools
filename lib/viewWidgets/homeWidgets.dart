import 'package:b_tools/views/contadores.dart';
import 'package:b_tools/views/notes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget bottomBar({required Function(int) onChange, required ThemeData theme, required int actual})=>BottomNavigationBar(
  elevation: 0,
  type: BottomNavigationBarType.shifting,
  items: [
    BottomNavigationBarItem(
      icon: const FaIcon(FontAwesomeIcons.noteSticky),
      label: "Notas",
      backgroundColor: theme.primaryColor
    ),
    BottomNavigationBarItem(
      icon: const FaIcon(FontAwesomeIcons.plusMinus),
      label: "Contadores",
      backgroundColor: theme.primaryColor
    ),
    /*BottomNavigationBarItem(
      icon: const FaIcon(FontAwesomeIcons.calculator),
      label: "Calculadora",
      backgroundColor: theme.primaryColor
    ),*/
  ],
  onTap: onChange,
  showSelectedLabels: true,
  showUnselectedLabels: false,
  currentIndex: actual,
);