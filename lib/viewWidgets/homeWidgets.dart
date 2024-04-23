import 'package:animate_do/animate_do.dart';
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
      activeIcon: _buildCardIcon(Icons.note_alt_rounded),
      label: "Notas",
      backgroundColor: theme.primaryColor
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.add_circle_outline),
      activeIcon: _buildCardIcon(Icons.add_circle),
      label: "Contadores",
      backgroundColor: theme.primaryColor
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.calculate_outlined),
      activeIcon: _buildCardIcon(Icons.calculate),
      label: "Calculadora",
      backgroundColor: theme.primaryColor
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.checklist),
      activeIcon: _buildCardIcon(Icons.checklist),
      label: "Tareas",
      backgroundColor: theme.primaryColor
    ),

  ],
  onTap: onChange,
  showSelectedLabels: true,
  showUnselectedLabels: false,
  currentIndex: actual,
);

Widget _buildCardIcon(IconData iconData) {
  return JelloIn(//JelloIn
    child: Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 0.3),
        borderRadius: BorderRadius.circular(12.0),
      ),
      padding: const EdgeInsets.only(top:6,bottom: 6,left: 18,right: 18),
      child: Icon(iconData),
    ),
  );
}