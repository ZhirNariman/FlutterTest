// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/theme_provider.dart';

class ZAnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  const ZAnimatedToggle({
    Key? key,
    required this.values,
    required this.onToggleCallback,
  }) : super(key: key);

  @override
  _ZAnimatedToggleState createState() => _ZAnimatedToggleState();
}

class _ZAnimatedToggleState extends State<ZAnimatedToggle> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      width: width *.4,
      height: 45,
      child: Stack(
        children: [
          GestureDetector(
              onTap: () {
                widget.onToggleCallback(1);
              },
              child: Container(
                width: width *.4,
                height: 90,
                decoration: ShapeDecoration(
                    color: themeProvider.themeMode().toggleBackgroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * .1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    widget.values.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: AutoSizeText(
                        widget.values[index],
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NewRudaw',
                            color: Color(0xFF918f95)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          
          AnimatedAlign(
            alignment: themeProvider.isLightTheme
                ? Alignment.centerLeft
                : Alignment.centerRight,
            duration: Duration(milliseconds: 350),
            curve: Curves.ease,
            child: Container(
              alignment: Alignment.center,
              width: width * 0.2,
              height: 45,
              decoration: ShapeDecoration(
                  color: themeProvider.themeMode().toggleButtonColor,
                  shadows: themeProvider.themeMode().shadow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * .1))),
              child: AutoSizeText(
                themeProvider.isLightTheme
                    ? widget.values[0]
                    : widget.values[1],
                    maxLines: 1,
                style: TextStyle(color: themeProvider.themeMode().textColor,fontFamily: 'NewRudaw',
                    fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
