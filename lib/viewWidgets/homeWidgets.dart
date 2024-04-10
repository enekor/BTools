import 'package:b_tools/views/contadores.dart';
import 'package:b_tools/views/notes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget bottomBar({required Function(int) onChange, required ThemeData theme, required int actual})=>BottomNavigationBar(
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
    )
  ],
  onTap: onChange,
  showSelectedLabels: true,
  currentIndex: actual,
);