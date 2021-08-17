// ignore_for_file: prefer_const_constructors, unused_local_variable, ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport/Model/theme_provider.dart';
import 'package:sport/Widgets/appbar.dart';
import 'package:sport/Widgets/transappbar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:
          themeProvider.isLightTheme ? Colors.grey.shade800 : Colors.white,
      body: SafeArea(
          child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: [
              Container(
                height: 210,
                color: Colors.green,
                child: Column(
                  children: [TransAppBar(header: 'دەربارە')],
                ),
              ),
              Positioned(
                  bottom: -60,
                  child: Container(
                    height: 115,
                    width: 115,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/bg.jpg',
                            ),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: themeProvider.isLightTheme
                                ? Colors.grey.shade800
                                : Colors.white,
                            width: 3)),
                  ))
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AutoSizeText('Zhir Nariman',maxLines:1,style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontSize: 20),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:12.0,right:12.0),
            child: AutoSizeText('I\'m Developer and also I develop this Application by myself',textAlign: TextAlign.center,maxLines:2,style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontSize: 10),),
          ),
        ],
      )),
    );
  }
}
