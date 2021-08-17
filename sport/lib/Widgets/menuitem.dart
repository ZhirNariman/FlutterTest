// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport/Model/theme_provider.dart';


Widget menuitem(
    {required String text,
    required IconData icon,
    required Function? onPressed,
    required BuildContext context}) {
  // final color = Colors.white;
  final hoverColor = Colors.white54;
  final themeProvider = Provider.of<ThemeProvider>(context);

  return FlatButton(
    color: themeProvider.isLightTheme ? Colors.grey[900] : Colors.grey[350],
    hoverColor: hoverColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 10.0),
        Text(
          text,
          style: TextStyle(
              color: themeProvider.isLightTheme ? Colors.white : Colors.black,
              fontFamily: 'NewRudaw'),
        ),
        Icon(
          icon,
          color: themeProvider.isLightTheme ? Colors.white : Colors.black,
        ),
      ],
    ),
    onPressed: () {
      onPressed!();
    },
  );
}
