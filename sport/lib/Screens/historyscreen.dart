// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sport/Model/hive_sys.dart';
import 'package:sport/Model/theme_provider.dart';
import 'package:sport/Widgets/appbar.dart';
import 'package:sport/Widgets/losser.dart';
import 'package:sport/Widgets/winner.dart';
import 'package:sport/util/boxes.dart';

const String todoBoxName = "history";

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Box<History>? history;

  @override
  void dispose() {
    Hive.close();
    history = Hive.box<History>(todoBoxName);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await Hive.openBox<History>('history');
    await Hive.openBox<TeamsInfo>('teaminfo');
    history = Hive.box<History>(todoBoxName);
    //setPreviousState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isLightTheme ?Colors.grey.shade800 : Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: .0),
              child: CosAppBar(header: 'مێژووی یارییەکان'),
            ),
            ValueListenableBuilder(
                valueListenable: Boxes.getHistory().listenable(),
                builder: (
                  context,
                  Box<History> box,
                  _,
                ) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          // reverse: true,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: box.length,
                          itemBuilder: (context, index) {
                            History? his = box.getAt(index);
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onDoubleTap: () {
                                  box.deleteAt(index);
                                },
                                child: Container(
                                    height: 153,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      color: themeProvider.isLightTheme ?Colors.grey.shade900: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(15.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: themeProvider.isLightTheme ?Colors.white54 :Colors.grey.shade900,
                                          blurRadius: 5,
                                          offset:
                                              Offset(0, 0), // Shadow position
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              //  Team One Data
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,

                                              children: [
                                                AutoSizeText(
                                                  '${his!.teamone}',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: themeProvider.isLightTheme ? Colors.white : Colors.black,
                                                      fontFamily: 'NewRudaw',
                                                      fontSize: 25),
                                                ),
                                                AutoSizeText(
                                                  '${his.scoreone}',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: themeProvider.isLightTheme ?Colors.white :Colors.black,
                                                      fontFamily: 'NewRudaw',
                                                      fontSize: 20),
                                                ),
                                                AutoSizeText(
                                                  '${his.foulone}',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: themeProvider.isLightTheme ? Colors.white : Colors.black,
                                                      fontFamily: 'NewRudaw',
                                                      fontSize: 18),
                                                ),
                                                his.scoreone! > his.scoretwo!
                                                    ? const Winner()
                                                    : const Losser()
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Icon(Icons.code_rounded,
                                                    size: 40,
                                                    color:
                                                        Colors.blue.shade900),
                                                AutoSizeText(
                                                  'خاڵ',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: themeProvider.isLightTheme ?Colors.white:Colors.black,
                                                      fontFamily: 'NewRudaw',
                                                      fontSize: 20),
                                                ),
                                                AutoSizeText(
                                                  'فاوڵ',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: themeProvider.isLightTheme ?Colors.white:Colors.black,
                                                      fontFamily: 'NewRudaw',
                                                      fontSize: 18),
                                                ),
                                                Container(
                                                  height: 20,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.blue.shade600,
                                                      boxShadow: [
                                                        const BoxShadow(
                                                          color: Colors.black38,
                                                          //8//  spreadRadius: 10,
                                                          blurRadius: 5,
                                                          offset: Offset(0,
                                                              0), // Shadow position
                                                        ),
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Center(
                                                      child: AutoSizeText(
                                                    '${his.date}',
                                                    maxLines: 1,
                                                    style: const TextStyle(
                                                        fontFamily: 'NewRudaw',
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              //  Team Tow Data
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,

                                              children: [
                                                AutoSizeText(
                                                  '${his.teamtwo}',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: themeProvider.isLightTheme ?Colors.white:Colors.black,
                                                      fontFamily: 'NewRudaw',
                                                      fontSize: 25),
                                                ),
                                                AutoSizeText(
                                                  '${his.scoretwo}',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: themeProvider.isLightTheme ?Colors.white:Colors.black,
                                                      fontFamily: 'NewRudaw',
                                                      fontSize: 20),
                                                ),
                                                AutoSizeText(
                                                  '${his.foultwo}',
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      color: themeProvider.isLightTheme ?Colors.white:Colors.black,
                                                      fontFamily: 'NewRudaw',
                                                      fontSize: 18),
                                                ),
                                                his.scoreone! > his.scoretwo!
                                                    ? const Losser()
                                                    : const Winner()
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ),
                            );
                          }),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
