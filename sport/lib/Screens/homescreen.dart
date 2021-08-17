// ignore_for_file: unused_field, prefer_final_fields, await_only_futures, prefer_const_constructors, deprecated_member_use, unused_local_variable, avoid_print, prefer_typing_uninitialized_variables

import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport/Model/hive_sys.dart';
import 'package:sport/Model/theme_provider.dart';
import 'package:sport/Screens/commingsoon.dart';
import 'package:sport/util/boxes.dart';
import 'package:sport/Screens/basket.dart';
import 'package:sport/Widgets/navdrawer.dart';


const String todoBoxName = "teaminfo";
const String historyBox = "history";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

TextEditingController team1ne = TextEditingController();
TextEditingController team2wo = TextEditingController();

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Box<TeamsInfo>? teams;
  Box<History>? history;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 250.0;
  bool isEnabled = false;
  String _teamname = '';
  String _teamname2 = '';

  late SharedPreferences prefs;

  bool _canShowButton = true;


  void hideCode() {
    setState(() {
      _canShowButton = !_canShowButton;
    });
  }

  @override
  void initState() {
    Hive.openBox<TeamsInfo>('teaminfo');
    Hive.openBox<History>('history');
    Hive.openBox('settings');
    super.initState();
    init();
  }

  void init() async {
    await Hive.openBox<History>('history');
    await Hive.openBox<TeamsInfo>('teaminfo');
    await Hive.openBox<History>('history');
    prefs = await SharedPreferences.getInstance();
    _canShowButton = prefs.getBool('DoIt') ?? true;

    teams = await Hive.box<TeamsInfo>(todoBoxName);
    history = await Hive.box<History>(historyBox);
    //  setPreviousState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 4.8;
    var width = MediaQuery.of(context).size.width;
    int? index = 0;
    Box<TeamsInfo>? box;
    TeamsInfo todo = TeamsInfo('Team 1', 0, 0, 'Team 2', 0, 0);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: themeProvider.isLightTheme
            ? Color(0x00232323).withOpacity(0.9)
            : Colors.white,
        endDrawer: NavDrawer(),
        appBar: AppBar(
          // brightness: themeColors(),
          elevation: 0.0,
          backgroundColor:
              themeProvider.isLightTheme ? Colors.grey.shade900 : Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'یارییە وەرزشییەکان',
            style: TextStyle(
                color: themeProvider.isLightTheme ? Colors.white : Colors.black,
                fontFamily: 'NewRudaw',
                fontSize: 20.0),
          ),
          actions: [
            Builder(builder: (context) {
              return GestureDetector(
                onTap: () => Scaffold.of(context).openEndDrawer(),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Container(
                      width: 36,
                      height: 40,
                      decoration: BoxDecoration(
                          color: themeProvider.isLightTheme
                              ? Colors.grey[850]
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.menu_rounded,
                          size: 21.0,
                          color: themeProvider.isLightTheme
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
              );
            })
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              height: 880,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: themeProvider.isLightTheme ? Colors.black12 : Colors.grey[350]),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                  height: 0.0,
                ),
                SizedBox(
                    height: 190,
                    width: double.infinity,
                    child: CarouselSlider(
                      items: [
                        Container(
                          margin: EdgeInsets.only(
                              left: 5.0, right: 5.0, bottom: 5.0, top: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/image/creator.jpg'))),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 5.0, right: 5.0, bottom: 5.0, top: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      AssetImage('assets/image/bgbasket.jpg'))),
                        )
                      ],
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 300),
                        viewportFraction: 0.8,
                      ),
                    )),
                SizedBox(height: 15.0),
                Expanded(
                  child: Column(
                    children: [
                      Text('بەشەکان',
                          style: TextStyle(
                              color: themeProvider.isLightTheme ? Colors.white : Colors.black,
                              fontFamily: 'NewRudaw',
                              fontSize: 25.0)),

                      Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 10.0),
                          child: ValueListenableBuilder(
                            valueListenable: Boxes.getTeamInfo().listenable(),
                            builder: (context, Box<TeamsInfo> box, _) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BasketMeter(
                                                value1: '',
                                                value2: '',
                                              )));
                                  !_canShowButton
                                      ? print('We still Trying')
                                      : {
                                          box.put(index, todo),
                                          hideCode(),
                                          prefs.setBool('DoIt', _canShowButton),
                                          print('The job is done Don ☠')
                                        };
                                },
                                child: Container(
                                  height: height,
                                  width: width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,

                                          // ignore: prefer_const_literals_to_create_immutables
                                          colors: [
                                            Colors.deepOrange.shade900,
                                            Colors.orange
                                          ])),
                                  margin: EdgeInsets.only(top: 40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 35.0),
                                          child: AutoSizeText(
                                            'پێوانی خاڵی\n تۆپی سەبەتە',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontFamily: 'NewRudaw',
                                                color: Colors.white,
                                                fontSize: 30.0),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Image.asset(
                                          'assets/image/basket.png',
                                          scale: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 10.0, top: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Coming()));
                            },
                            child: Container(
                              height: height,
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0x0000511E).withOpacity(1),
                                        Color(0x0000AC5B).withOpacity(1)
                                      ])),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 35.0),
                                      child: AutoSizeText(
                                        'پیوانی گۆڵی \nتۆپی پێ',
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'NewRudaw',
                                            color: Colors.white,
                                            fontSize: 30.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.asset(
                                      'assets/image/foot.png',
                                      scale: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, bottom: 10.0, top: 10.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Coming()));
                            },
                            child: Container(
                              height: height,
                              width: width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0x00440090).withOpacity(1),
                                        Color(0x00A400F7).withOpacity(1)
                                      ])),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 35.0),
                                      child: AutoSizeText(
                                        'پێوانی خاڵی \n بالە',
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'NewRudaw',
                                            color: Colors.white,
                                            fontSize: 30.0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.asset(
                                      'assets/image/Volly.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      // IconButton(
                      //                   onPressed: () => teams!.isEmpty ?
                      // Column(
                      //     children: <Widget>[
                      //       Text(
                      //         'No Data added yet!',
                      //         style: Theme.of(context).textTheme.headline6,
                      //       ),]) :teamSheet(context),
                      //                   icon: Icon(Icons.mode_edit_rounded,
                      //                       color: Colors.white)),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ));
  }

  void teamSheet(BuildContext context) {
    //   Box<TeamsInfo>? teams;
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.grey.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (context) {
          return Container(
            height: 500.0,
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 10.0, sigmaX: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 4,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                          Text('ناوی تیمەکان',
                              style: TextStyle(
                                  fontSize: 20.0, fontFamily: "NewRudaw")),
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
                          // TeamsInfo tein = TeamsInfo(team1,);
                          // teams!.add(tein);
                          initState();

                          Navigator.pop(
                            context,
                          );
                        },

                        color: Colors.blue,
                        child: Text(
                          'بیگۆڕە',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontFamily: 'NewRudaw', fontSize: 20.0),
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
  }
}



//   NetworkImage('https://www.loisirssportifscdn-ndg.com/wp-content/uploads/2018/01/basketball-2258651_960_720.jpg'),
