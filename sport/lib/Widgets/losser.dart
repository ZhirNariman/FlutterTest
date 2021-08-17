// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Losser extends StatelessWidget {
  const Losser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 50,
      // ignore: prefer_const_literals_to_create_immutables
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black38,
          //8//  spreadRadius: 10,
          blurRadius: 5,
          offset: Offset(0, 0), // Shadow position
        ),
      ], borderRadius: BorderRadius.circular(8), color: Colors.red),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            AutoSizeText('دۆڕاو',
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white, fontFamily: 'NewRudaw', fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
