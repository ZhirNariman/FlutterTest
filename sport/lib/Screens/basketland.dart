// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unnecessary_string_interpolations, sized_box_for_whitespace, prefer_adjacent_string_concatenation, unnecessary_const, avoid_unnecessary_containers, unused_local_variable

import 'dart:ui';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport/Model/hive_sys.dart';
import 'package:sport/Model/theme_provider.dart';
import 'package:sport/Widgets/appbar.dart';
import 'package:sport/util/boxes.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';

const String todoBoxName = "teaminfo";
const String historyBox = "history";

class BasketMeterLand extends StatefulWidget {
  final String value1;
  final String value2;
  //City item;
  const BasketMeterLand({
    Key? key,
    required this.value1,
    required this.value2,
  }) : super(key: key);

  @override
  @override
  _BasketMeterState createState() => _BasketMeterState();
}

class _BasketMeterState extends State<BasketMeterLand> {
  Box<TeamsInfo>? teams;
  Box<History>? history;

  @override
  void dispose() {
    Hive.close();
    // teams = Hive.box<TeamsInfo>(todoBoxName);
    // history = Hive.box<History>(todoBoxName);
    super.dispose();
  }

  int _score1 = 0;
  int _score2 = 0;
  int _foul = 0;
  int _foul2 = 0;
  int sec24 = 0;
  String _teamname = '';
  String _teamname2 = '';

  int indx = 0;
  // bool _canShowButton = true;

  // void hideWidget() {
  //   setState(() {
  //     _canShowButton = !_canShowButton;
  //   });
  // }

  late SharedPreferences prefs;

  bool _canShowButton = true;

  void hideWidget() {
    setState(() {
      _canShowButton = !_canShowButton;
    });
  }

  @override
  void initState() {
    Hive.openBox<TeamsInfo>('teaminfo');
    Hive.openBox<History>('history');
    super.initState();
    init();
  }

  void init() async {
    await Hive.openBox<History>('history');
    await Hive.openBox<TeamsInfo>(todoBoxName);
    
    // prefs = await SharedPreferences.getInstance();
    // _canShowButton = prefs.getBool('Show') ?? true;
    teams = Hive.box<TeamsInfo>(todoBoxName);
    history = Hive.box<History>(historyBox);
    setPreviousState();
  }

  void setPreviousState() {
    setState(() {
      final info = teams!.get(indx);
//-------------------------------
      // _teamname = info!.teamname!;
      // _teamname2 = info.teamname2!;
      _score1 = info!.scoreone!;
      _score2 = info.scoretwo!;
      _foul = info.foulone!;
      _foul2 = info.foultwo!;
      // sec24= info.teamname;
    });
  }

  // void _refreash() {
  //   setState(() {
  //     final info = teams!.getAt(index);
  //     _score1 = 0;
  //     _score2 = 0;
  //     _foul = 0;
  //     _foul2 = 0;
  //     info!.scoreone! == 0;
  //     info.scoretwo! == 0;
  //     info.foulone! == 0;
  //     info.foultwo! == 0;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(
  //       team!.teamname, _score1, _foul, team.teamname2, _score2, _foul2);
  //   teams!.put(index, todo);
  // }

  TextEditingController team1ne = TextEditingController();
  TextEditingController team2wo = TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {
    final StopWatchTimer _stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromSecond(24),
      //   // onChange: (value) => print('onChange $value'),
      //   // onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
      //   // onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
      //   // onEnded: () {
      //   //   print('onEnded');
    );
    final StopWatchTimer _stopWatchTimer14 = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromSecond(14),
      //   // onChange: (value) => print('onChange $value'),
      //   // onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
      //   // onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
      //   // onEnded: () {
      //   //   print('onEnded');
    );

    var width = MediaQuery.of(context).size.width * (1/2.1);
        final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor:themeProvider.isLightTheme ?  Colors.grey.shade800:Colors.white,
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: [
            const CosAppBar(header: 'پێوانی خاڵی تۆپی سەبەتە'),
            ValueListenableBuilder(
              valueListenable: Boxes.getTeamInfo().listenable(),
              builder: (
                context,
                Box<TeamsInfo> box,
                _,
              ) {
                int? index = 0;
                TeamsInfo? info = box.getAt(index);
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, left: 8.0, top: 5.0, bottom: 5.0),
                          child: Container(
                            height: 282.0,
                            width: width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [themeProvider.isLightTheme ?Colors.black87:Colors.white,themeProvider.isLightTheme ? Colors.grey.shade700: Colors.grey.shade300]),
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: themeProvider.isLightTheme ? Colors.white54 : Colors.black38,
                                  blurRadius: 10,
                                  offset: const Offset(0, 0), // Shadow position
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(children: [
                                    /// Display every second.
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, top: 2.0),
                                      child: StreamBuilder<int>(
                                        stream: _stopWatchTimer.secondTime,
                                        initialData:
                                            _stopWatchTimer.secondTime.value,
                                        builder: (context, snap) {
                                          final value = snap.data;
                                          print('Listen every second. $value');
                                          return Column(
                                            children: <Widget>[
                                              ElevatedButton(
                                                  onPressed: () async {
                                                    _stopWatchTimer.onExecute.add(
                                                        StopWatchExecute.start);
                                                  },
                                                  onLongPress: () async {
                                                    _stopWatchTimer.onExecute.add(
                                                        StopWatchExecute.reset);
                                                  },
                                                  child: Text(
                                                    value.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 25,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),
                                                  )),
                                            ],
                                          );
                                        },
                                      ),
                                    ),

                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 30.0),
                                        child: AutoSizeText('${info?.teamname}',
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: themeProvider.isLightTheme ? Colors.white: Colors.black,
                                                fontSize: 25.0,
                                                fontFamily: 'Poppins')),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      child: IconButton(
                                          onPressed: () => teamSheet(context),
                                          icon: Icon(Icons.mode_edit_rounded,
                                              color: themeProvider.isLightTheme ? Colors.white: Colors.black,)),
                                    ),
                                  ]),
                                  AutoSizeText("${info?.scoreone}",
                                      style: TextStyle(
                                          color: themeProvider.isLightTheme ? Colors.white: Colors.black,
                                          fontSize: 40.0,
                                          fontFamily: 'Poppins')),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0, right: 10.0),
                                            child: SizedBox(
                                              width: 70.0,
                                              height: 70.0,
                                              child: RaisedButton(
                                                onPressed: () {
                                                  _score1--;

                                                  TeamsInfo todo = TeamsInfo(
                                                      info!.teamname,
                                                      _score1,
                                                      info.foulone,
                                                      info.teamname2,
                                                      info.scoretwo,
                                                      info.foultwo);
                                                  box.put(index, todo);
                                                },
                                                color: Colors.red,
                                                textColor: Colors.white,
                                                elevation: 10.0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0)),
                                                child: const AutoSizeText("-1",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 26.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0, right: 10.0),
                                            child: SizedBox(
                                              width: 70.0,
                                              height: 70.0,
                                              child: RaisedButton(
                                                onPressed: () {
                                                  _score1++;

                                                  TeamsInfo todo = TeamsInfo(
                                                      info!.teamname,
                                                      _score1,
                                                      info.foulone,
                                                      info.teamname2,
                                                      info.scoretwo,
                                                      info.foultwo);
                                                  box.put(index, todo);
                                                },
                                                color: Colors.yellow.shade700,
                                                textColor: Colors.white,
                                                elevation: 10.0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0)),
                                                child: const AutoSizeText("+1",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 26.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0, right: 10.0),
                                            child: SizedBox(
                                              width: 70.0,
                                              height: 70.0,
                                              child: RaisedButton(
                                                onPressed: () {
                                                  _score1 += 2;

                                                  TeamsInfo todo = TeamsInfo(
                                                      info!.teamname,
                                                      _score1,
                                                      info.foulone,
                                                      info.teamname2,
                                                      info.scoretwo,
                                                      info.foultwo);
                                                  box.put(index, todo);
                                                },
                                                color: Colors.green,
                                                textColor: Colors.white,
                                                elevation: 10.0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0)),
                                                child: const AutoSizeText("+2",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 24.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0, right: 10.0),
                                            child: SizedBox(
                                              width: 70.0,
                                              height: 70.0,
                                              child: RaisedButton(
                                                onPressed: () {
                                                  _score1 += 3;

                                                  TeamsInfo todo = TeamsInfo(
                                                      info!.teamname,
                                                      _score1,
                                                      info.foulone,
                                                      info.teamname2,
                                                      info.scoretwo,
                                                      info.foultwo);
                                                  box.put(index, todo);
                                                },
                                                color: Colors.indigo,
                                                textColor: Colors.white,
                                                elevation: 10.0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0)),
                                                child: const AutoSizeText("+3",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 24.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25.0, right: 15.0),
                                        child: AutoSizeText(
                                            'Fouls: ' "${info?.foulone}",
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: themeProvider.isLightTheme ? Colors.white: Colors.black,
                                                fontSize: 25.0,
                                                fontFamily: 'Poppins')),
                                      ),
                                      Expanded(
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0,
                                                right: 20.0,
                                                bottom: 15.0,
                                                top: 10.0),
                                            child: SizedBox(
                                                width: 46.0,
                                                height: 46.0,
                                                child: RaisedButton(
                                                    onPressed: () {
                                                      _foul++;

                                                      TeamsInfo todo = TeamsInfo(
                                                          info!.teamname,
                                                          info.scoreone,
                                                          _foul,
                                                          info.teamname2,
                                                          info.scoretwo,
                                                          info.foultwo);
                                                      box.put(index, todo);
                                                    },
                                                    color: Colors.red.shade700,
                                                    textColor: Colors.white,
                                                    elevation: 10.0,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15.0)),
                                                    child: const AutoSizeText("+1",
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontSize: 21.0,
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight
                                                                .bold))))),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0,
                                              right: 20.0,
                                              bottom: 15.0,
                                              top: 10.0),
                                          child: SizedBox(
                                              width: 46.0,
                                              height: 46.0,
                                              child: RaisedButton(
                                                  onPressed: () {
                                                    _foul--;

                                                    TeamsInfo todo = TeamsInfo(
                                                        info!.teamname,
                                                        info.scoreone,
                                                        _foul,
                                                        info.teamname2,
                                                        info.scoretwo,
                                                        info.foultwo);
                                                    box.put(index, todo);
                                                  },
                                                  color: Colors.green.shade700,
                                                  textColor: Colors.white,
                                                  elevation: 10.0,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  child: const AutoSizeText("-1",
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontSize: 21.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold)))),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 282.0,
                            width: width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [themeProvider.isLightTheme ?Colors.black87:Colors.white,themeProvider.isLightTheme ? Colors.grey.shade700: Colors.grey.shade300]),
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                 BoxShadow(
                                  color: themeProvider.isLightTheme ? Colors.white54: Colors.black38 ,
                                  blurRadius: 10,
                                  offset: Offset(0, 0), // Shadow position
                                ),
                              ],
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(children: [
                                    /// Display every second.
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, top: 2.0),
                                      child: StreamBuilder<int>(
                                        stream: _stopWatchTimer14.secondTime,
                                        initialData:
                                            _stopWatchTimer14.secondTime.value,
                                        builder: (context, snap) {
                                          final value = snap.data;
                                          print('Listen every second. $value');
                                          return Column(
                                            children: <Widget>[
                                              ElevatedButton(
                                                  onPressed: () async {
                                                    _stopWatchTimer14.onExecute.add(
                                                        StopWatchExecute.start);
                                                  },
                                                  onLongPress: () async {
                                                    _stopWatchTimer14.onExecute.add(
                                                        StopWatchExecute.reset);
                                                  },
                                                  child: Text(
                                                    value.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 25,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white),
                                                  )),
                                            ],
                                          );
                                        },
                                      ),
                                    ),

                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 30.0),
                                        child: AutoSizeText("${info?.teamname2}",
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: themeProvider.isLightTheme ? Colors.white: Colors.black,
                                                fontSize: 25.0,
                                                fontFamily: 'Poppins')),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 40,
                                      child: IconButton(
                                          onPressed: () => teamSheet(context),
                                          icon: Icon(Icons.mode_edit_rounded,
                                              color: Colors.grey.shade800)),
                                    ),
                                  ]),
                                  AutoSizeText("${info?.scoretwo}",
                                      style: TextStyle(
                                          color: themeProvider.isLightTheme ? Colors.white: Colors.black,
                                          fontSize: 40.0,
                                          fontFamily: 'Poppins')),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0, right: 10.0),
                                            child: SizedBox(
                                              width: 70.0,
                                              height: 70.0,
                                              child: RaisedButton(
                                                onPressed: () {
                                                  _score2--;

                                                  TeamsInfo todo = TeamsInfo(
                                                      info!.teamname,
                                                      info.scoreone,
                                                      info.foulone,
                                                      info.teamname2,
                                                      _score2,
                                                      info.foultwo);
                                                  box.put(index, todo);
                                                },
                                                color: Colors.red,
                                                textColor: Colors.white,
                                                elevation: 10.0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0)),
                                                child: const AutoSizeText("-1",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 26.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0, right: 10.0),
                                            child: SizedBox(
                                              width: 70.0,
                                              height: 70.0,
                                              child: RaisedButton(
                                                onPressed: () {
                                                  _score2++;

                                                  TeamsInfo todo = TeamsInfo(
                                                      info!.teamname,
                                                      info.scoreone,
                                                      info.foulone,
                                                      info.teamname2,
                                                      _score2,
                                                      info.foultwo);
                                                  box.put(index, todo);
                                                },
                                                color: Colors.yellow.shade700,
                                                textColor: Colors.white,
                                                elevation: 10.0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0)),
                                                child: const AutoSizeText("+1",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 26.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0, right: 10.0),
                                            child: SizedBox(
                                              width: 70.0,
                                              height: 70.0,
                                              child: RaisedButton(
                                                onPressed: () {
                                                  _score2 += 2;

                                                  TeamsInfo todo = TeamsInfo(
                                                      info!.teamname,
                                                      info.scoreone,
                                                      info.foulone,
                                                      info.teamname2,
                                                      _score2,
                                                      info.foultwo);
                                                  box.put(index, todo);
                                                },
                                                color: Colors.green,
                                                textColor: Colors.white,
                                                elevation: 10.0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0)),
                                                child: const AutoSizeText("+2",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 24.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0, right: 10.0),
                                            child: SizedBox(
                                              width: 70.0,
                                              height: 70.0,
                                              child: RaisedButton(
                                                onPressed: () {
                                                  _score2 += 3;

                                                  TeamsInfo todo = TeamsInfo(
                                                      info!.teamname,
                                                      info.scoreone,
                                                      info.foulone,
                                                      info.teamname2,
                                                      _score2,
                                                      info.foultwo);
                                                  box.put(index, todo);
                                                },
                                                color: Colors.indigo,
                                                textColor: Colors.white,
                                                elevation: 10.0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0)),
                                                child: const AutoSizeText("+3",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontSize: 24.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25.0, right: 15.0),
                                        child: AutoSizeText(
                                            'Fouls: ' "${info?.foultwo}",
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: themeProvider.isLightTheme ? Colors.white: Colors.black,
                                                fontSize: 25.0,
                                                fontFamily: 'Poppins')),
                                      ),
                                      Expanded(
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0,
                                                right: 20.0,
                                                bottom: 15.0,
                                                top: 10.0),
                                            child: SizedBox(
                                                width: 46.0,
                                                height: 46.0,
                                                child: RaisedButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _foul2++;

                                                        TeamsInfo todo = TeamsInfo(
                                                            info!.teamname,
                                                            info.scoreone,
                                                            info.foulone,
                                                            info.teamname2,
                                                            info.scoretwo,
                                                            _foul2);
                                                        box.put(index, todo);
                                                      });
                                                    },
                                                    color: Colors.red.shade700,
                                                    textColor: Colors.white,
                                                    elevation: 10.0,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15.0)),
                                                    child: const AutoSizeText("+1",
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontSize: 21.0,
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight
                                                                .bold))))),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0,
                                              right: 20.0,
                                              bottom: 15.0,
                                              top: 10.0),
                                          child: SizedBox(
                                              width: 46.0,
                                              height: 46.0,
                                              child: RaisedButton(
                                                  onPressed: () {
                                                    _foul2--;

                                                    TeamsInfo todo = TeamsInfo(
                                                        info!.teamname,
                                                        info.scoreone,
                                                        info.foulone,
                                                        info.teamname2,
                                                        info.scoretwo,
                                                        _foul2);
                                                    box.put(index, todo);
                                                    todo.save();
                                                  },
                                                  color: Colors.green.shade700,
                                                  textColor: Colors.white,
                                                  elevation: 10.0,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  child: const AutoSizeText("-1",
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontSize: 21.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.bold)))),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        

                        ///if the show button is false
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: !_canShowButton
                        //       ? const SizedBox.shrink()
                        //       : RaisedButton(
                        //           child: Text('Start'),
                        //           textColor: Colors.white,
                        //           elevation: 7.0,
                        //           color: Colors.blue,
                        //           onPressed: () {
                        //             TeamsInfo todo = TeamsInfo(
                        //                 'TeamNmae', 0, 0, 'TeamName2', 0, 0);
                        //             box.put(index, todo);
                        //             hideWidget();
                        //             prefs.setBool('Show', _canShowButton);

                        //             //_number();
                        //           },
                        //         ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: RaisedButton(
                        //     onPressed: () {
                        //       TeamsInfo todo =
                        //           TeamsInfo('TeamNmae', 0, 0, 'TeamName2', 0, 0);
                        //       box.put(index, todo);
                        //     },
                        //     child: const Text('Start'),
                        //   ),
                        // )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(5.0)),
                        RaisedButton(
                            onPressed: () {
                              showCupertinoModalPopup(
                                  filter:
                                      ImageFilter.blur(sigmaY: 5.0, sigmaX: 5.0),
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                        ),
                                        child: CupertinoActionSheet(
                                          title: const Text(
                                              'دڵنیای لە نوێ کردنەوەی داتاکان؟',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'NewRudaw',
                                                fontSize: 20.0,
                                              )),
                                          message: const Text(
                                              'بۆ نوێکردنەوەی داتاکان کتە لە بەڵێ بکە',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'NewRudaw',
                                              )),
                                          actions: <Widget>[
                                            CupertinoDialogAction(
                                              child: const Text(
                                                'نەخێر',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'NewRudaw',
                                                ),
                                              ),
                                              onPressed: () {
                                                Navigator.pop(
                                                  context,
                                                );
                                              },
                                            ),
                                            CupertinoDialogAction(
                                                child: const Text(
                                                  'بەڵێ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'NewRudaw',
                                                  ),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _score1 = 0;
                                                    _score2 = 0;
                                                    _foul = 0;
                                                    _foul2 = 0;
                                                  });

                                                  TeamsInfo todo = TeamsInfo(
                                                      info!.teamname,
                                                      _score1,
                                                      _foul,
                                                      info.teamname2,
                                                      _score2,
                                                      _foul2);
                                                  box.put(index, todo);
                                                  Navigator.pop(
                                                    context,
                                                  );
                                                })
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            color: Colors.red,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            child: const Text("نوێ کردنەوە",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20.0, fontFamily: 'NewRudaw'))),
                        ValueListenableBuilder(
                            valueListenable: Boxes.getHistory().listenable(),
                            builder: (context, Box<History> box, _) {
                              return Padding(
                                padding: const EdgeInsets.all(10),
                                child: RaisedButton(
                                  onPressed: () {
                                    setState(() {
                                      DateTime now = DateTime.now();
                                      print('${now.year}/${now.month}/${now.day}');
                                      //   History his = History(info!.teamname,info.scoreone,info.foulone,info.teamname2,info.scoretwo,info.foultwo,'${now.year}/${now.month}/${now.day}');
                                      box.add(History(
                                          info!.teamname,
                                          info.scoreone,
                                          info.foulone,
                                          info.teamname2,
                                          info.scoretwo,
                                          info.foultwo,
                                          '${now.year}/${now.month}/${now.day}'));
                                      //addTodo(City(city: _teamname,country: _teamname2,date: now.toString()));
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  textColor: Colors.white,
                                  color: Colors.blue,
                                  child: const Text("تۆمارکردن",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20.0, fontFamily: 'NewRudaw')),
                                ),
                              );
                            }),
                  ],
                );
              },
            ),
          ]))),
        ));
  }

  void teamSheet(BuildContext context1) {
    //   Box<TeamsInfo>? teams;
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.grey.withOpacity(0.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (context) {
          return ValueListenableBuilder(
              valueListenable: Boxes.getTeamInfo().listenable(),
              builder: (
                BuildContext context,
                Box<TeamsInfo> box,
                _,
              ) {
                int index = 0;
                TeamsInfo? info = box.getAt(index);
                return Container(
                  height: 500.0,
                  decoration: BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 10.0, sigmaX: 10.0),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 4,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ),
                                const Text('ناوی تیمەکان',
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: "NewRudaw")),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: team1ne,
                              autofocus: false,
                              decoration: InputDecoration(
                                labelText: 'Team 1',
                                hintText: 'Lakers, Warriors,Phinix',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                              ),
                              keyboardType: TextInputType.text,
                              onChanged: (text) {
                                _teamname = text;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: team2wo,
                              autofocus: false,
                              decoration: InputDecoration(
                                labelText: 'Team 2',
                                hintText: 'Brooklyn, Milwaukee',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                              ),
                              keyboardType: TextInputType.text,
                              onChanged: (text) {
                                _teamname2 = text;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: RaisedButton(
                              onPressed: () {
                                final String team1 = team1ne.text;
                                final String team2 = team2wo.text;
                                final TeamsInfo? team = box.get(index);

                                if (_teamname != "") {
                                  TeamsInfo tein = TeamsInfo(
                                      _teamname,
                                      team!.scoreone,
                                      team.foulone,
                                      _teamname2,
                                      team.scoretwo,
                                      team.foultwo);
                                  box.put(index, tein);
                                }

                                Navigator.pop(context);
                                init();
                                team1ne.clear();
                                team2wo.clear();
                              },

                              color: Colors.blue,
                              child: const Text(
                                'بیگۆڕە',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'NewRudaw', fontSize: 20.0),
                              ),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              // style: TextStyle(fontSize: 20.0,fontFamily: 'NewRudaw')))
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
