import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport/Model/theme_provider.dart';
import 'package:sport/Widgets/appbar.dart';

class Coming extends StatefulWidget {
  const Coming({Key? key}) : super(key: key);

  @override
  _ComingState createState() => _ComingState();
}

class _ComingState extends State<Coming> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor:
          themeProvider.isLightTheme ? Colors.grey.shade800 : Colors.white,
      body: SafeArea(
          child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const CosAppBar(header: "بەمزوانە"),
          Center(
            child: Text(
              'بەمزوانە بەردەست دەبێت',
              style: TextStyle(
                  fontFamily: 'NewRudaw',
                  color:
                      themeProvider.isLightTheme ? Colors.white : Colors.black,
                  fontSize: 35),
            ),
          )
        ],
      )),
    );
  }
}
