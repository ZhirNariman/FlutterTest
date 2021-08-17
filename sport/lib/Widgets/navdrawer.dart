// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport/Model/theme_provider.dart';
import 'package:sport/Screens/about.dart';
import 'package:sport/Screens/commingsoon.dart';
import 'package:sport/Screens/historyscreen.dart';
import 'package:sport/Screens/settings.dart';
import 'package:sport/Widgets/menuitem.dart';


class NavDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //bool _lights = false;
        final themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Container(
        width: 210,
        child: Drawer(
          child: Material(
              color: themeProvider.isLightTheme ? Colors.grey[850]: Colors.white,
              child: ListView(
                padding: padding,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Sport App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: themeProvider.isLightTheme ? Colors.white : Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: 20)),
                  const SizedBox(
                    height: 20,
                  ),
                  menuitem(
                    text: 'سەرەتا',
                    icon: Icons.home_rounded,
                    onPressed: () => Navigator.pop(context), context: context,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  menuitem(
                      text: 'پێوانەکان',
                      icon: Icons.score_rounded,
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Coming()));
                      }, context: context),
                  const SizedBox(
                    height: 20,
                  ),
                  menuitem(
                      text: 'مێژوو',
                      icon: Icons.history_rounded,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HistoryScreen()));
                      }, context: context),
                  const SizedBox(
                    height: 20,
                  ),
                  menuitem(
                      text: 'زانیاری',
                      icon: Icons.info,
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Coming()));
                      }, context: context),
                  const SizedBox(
                    height: 20,
                  ),
                  menuitem(
                      text: 'ڕیکخستن',
                      icon: Icons.settings,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Settings()));
                      }, context: context),
                  const SizedBox(
                    height: 20,
                  ),
                  menuitem(
                      text: 'دەربارە',
                      icon: Icons.code_rounded,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Coming()));
                      }, context: context),
                  SizedBox(
                    height: 350,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child:
                        Text('this version is just for Test from Zhir Nariman',
                            style: TextStyle(
                              fontSize: 8,
                              color: themeProvider.isLightTheme ? Colors.white : Colors.black,
                            )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text('this app was created by Zhir Nariman',
                        style: TextStyle(
                          fontSize: 10,
                          color: themeProvider.isLightTheme ? Colors.white : Colors.black,
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
