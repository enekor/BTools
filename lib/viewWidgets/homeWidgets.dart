import 'package:b_tools/views/contadores.dart';
import 'package:b_tools/views/notes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget bottomBar({required Function(int) onChange, required ThemeData theme, required int actual})=>BottomNavigationBar(
  elevation: 0,
  type: BottomNavigationBarType.shifting,
  items: [
    BottomNavigationBarItem(
      icon: const Icon(Icons.note_alt_outlined),
      activeIcon: const Icon(Icons.note_alt_rounded),
      label: "Notas",
      backgroundColor: theme.primaryColor
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.add_circle_outline),
      activeIcon: const Icon(Icons.add_circle),
      label: "Contadores",
      backgroundColor: theme.primaryColor
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.calculate_outlined),
      activeIcon: const Icon(Icons.calculate),
      label: "Calculadora",
      backgroundColor: theme.primaryColor
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.checklist),
      activeIcon: const Icon(Icons.checklist),
      label: "Tareas",
      backgroundColor: theme.primaryColor
    ),

  ],
  onTap: onChange,
  showSelectedLabels: true,
  showUnselectedLabels: false,
  currentIndex: actual,
);