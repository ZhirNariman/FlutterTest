// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:sport/Model/theme_provider.dart';
import 'package:sport/Widgets/appbar.dart';
import 'package:sport/z_animated_toggle.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    Hive.openBox('settings');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Hive.openBox('settings');
   // double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor:
            themeProvider.isLightTheme ? Colors.grey.shade800 : Colors.white,
        body: SafeArea(
          child: Center(
              child: Column(children: [
            const CosAppBar(header: "ڕێکخستن"),
            Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 50,
                    color: themeProvider.isLightTheme
                        ? Colors.grey.shade800
                        : Colors.white,
                  ),
                ),
                Positioned(
                  left: 10,
                  child: ZAnimatedToggle(
                      values: ['تاریک', 'روناک'],
                      onToggleCallback: (v) async {
                        await themeProvider.toggleThemeData();
                        setState(() {});
                      }),
                ),
                Positioned(
                  right: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      'دۆخی تاریک',
                      maxLines: 1,
                      style: TextStyle(
                          color: themeProvider.isLightTheme
                              ? Colors.white
                              : Colors.black,
                          fontFamily: 'NewRudaw',
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ])),
        ));
  }
}
