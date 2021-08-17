// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport/Model/theme_provider.dart';
import 'package:sport/Screens/homescreen.dart';

class TransAppBar extends StatelessWidget {
  const TransAppBar({Key? key, required this.header}) : super(key: key);

  final String header;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      height: 75,
      decoration: BoxDecoration(
          color:
              Colors.transparent,
          
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Container(
                    width: 36,
                    height: 38,
                    decoration: BoxDecoration(
                        color: themeProvider.isLightTheme
                            ? Colors.grey[850]!.withOpacity(0.2)
                            : Colors.grey.shade300.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(CupertinoIcons.back,
                            size: 21.0,
                            color: themeProvider.isLightTheme
                                ? Colors.white
                                : Colors.black),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: AutoSizeText(
              header,
              maxLines: 1,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color:
                      themeProvider.isLightTheme ? Colors.white : Colors.black,
                  fontFamily: 'NewRudaw',
                  fontSize: 25.0),
            ),
          ))
        ],
      ),
    );
  }
}
