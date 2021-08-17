// import 'package:flutter/material.dart';

// InkWell(
//                           splashColor: Colors.white,

//                           customBorder: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(25)),
//                           onTap: () {},
//                           child: Stack(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.all(15),
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                       begin: Alignment.centerLeft,
//                                       end: Alignment.centerRight,
//                                       colors: [
//                                         Colors.purple.shade900.withOpacity(0.9),
//                                         Colors.purple.withOpacity(0.9)
//                                       ]),
//                                   borderRadius: BorderRadius.circular(25),
//                             //      color: Colors.green,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Color(0xFF282547).withOpacity(.15),
//                                       blurRadius: 20,
//                                     ),
//                                   ],
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     SizedBox(),
//                                     Container(
//                                       padding: EdgeInsets.all(10),
//                                       decoration: BoxDecoration(
//                                         color: Colors.green.withOpacity(.1),
//                                         shape: BoxShape.circle,
//                                       ),
//                                       child: Image.asset(
//                                         "assets/image/Volly.png",
//                                         height: 40,
//                                         width: 40,
//                                         color: Colors.green.withOpacity(.6),
//                                       ),
//                                     ),
//                                     Text(
//                                       "Hi Zhir",
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                       textAlign: TextAlign.center,
//                                     ),
//                                     SizedBox(),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 10.0, vertical: 5.0),
//                                 decoration: BoxDecoration(
//                                   color: Color(0x83CEECE8),
//                                   borderRadius: BorderRadius.only(
//                                       bottomRight: Radius.circular(10),
//                                       topLeft: Radius.circular(20)),
//                                 ),
//                                 child: Text(
//                                   '1',
//                                   textAlign: TextAlign.center,
//                                   style: new TextStyle(
//                                     color: Colors.green,
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),


//                           void init() async {
    
//     prefs = await SharedPreferences.getInstance();
//     _teamname = prefs.getString('teamname') ?? '';
//     _teamname2 = prefs.getString('teamname2') ?? '';
//     _score1 = prefs.getInt('score1') ?? 0;
//     _score2 = prefs.getInt('score2') ?? 0;
//     _foul = prefs.getInt('foul1') ?? 0;
//     _foul2 = prefs.getInt('foul2') ?? 0;
//     sec24 = prefs.getInt('sec24') ?? 0;

//     setPreviousState();
//   }

//   void setPreviousState() {
//     setState(() {
//       _teamname;
//       _teamname2;
//       _score1;
//       _score2;
//       _foul;
//       _foul2;
//       sec24;
//     });
//   }

//   void score11() {
//     setState(() {
//       _score1++;
//     });
//     prefs.setInt('score1', _score1);
//   }

//   void score12() {
//     setState(() {
//       _score1 += 2;
//     });
//     prefs.setInt('score1', _score1);
//   }

//   void score13() {
//     setState(() {
//       _score1 += 3;
//     });
//     prefs.setInt('score1', _score1);
//   }

//   void score10() {
//     setState(() {
//       _score1--;
//     });
//     prefs.setInt('score1', _score1);
//   }

//   void score21() {
//     setState(() {
//       _score2++;
//       TeamOne teamOne;
      
//     });
//     prefs.setInt('score2', _score2);
//   }

//   void score22() {
//     setState(() {
//       _score2 += 2;
//     });
//     prefs.setInt('score2', _score2);
//   }

//   void score23() {
//     setState(() {
//       _score2 += 3;
//     });
//     prefs.setInt('score2', _score2);
//   }

//   void score20() {
//     setState(() {
//       _score2--;
//     });
//     prefs.setInt('score2', _score2);
//   }

//   void foul1() {
//     setState(() {
//       _foul++;
//     });
//     prefs.setInt('foul1', _foul);
//   }

//   void foul10() {
//     setState(() {
//       _foul--;
//     });
//     prefs.setInt('foul1', _foul);
//   }

//   void foul2() {
//     setState(() {
//       _foul2++;
//     });
//     prefs.setInt('foul2', _foul2);
//   }

//   void foul20() {
//     setState(() {
//       _foul2--;
//     });
//     prefs.setInt('foul2', _foul2);
//   }

//   void _refreash() {
//     setState(() {
//       _score1 = 0;
//       _score2 = 0;
//       _foul = 0;
//       _foul2 = 0;
//     });
//     prefs.setInt('score1', _score1);
//     prefs.setInt('score2', _score2);
//     prefs.setInt('foul1', _foul);
//     prefs.setInt('foul2', _foul2);
//   }






  // void score11() {
  //   setState(() {
  //     _score1++;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(team!.teamname, _score1, team.foulone,
  //       team.teamname2, team.scoretwo, team.foultwo);
  //   teamsInfo!.put(index, todo);
  // }

  // void score12() {
  //   setState(() {
  //     _score1 += 2;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(team!.teamname, _score1, team.foulone,
  //       team.teamname2, team.scoretwo, team.foultwo);
  //   teamsInfo!.put(index, todo);
  // }

  // void score13() {
  //   setState(() {
  //     _score1 += 3;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(team!.teamname, _score1, team.foulone,
  //       team.teamname2, team.scoretwo, team.foultwo);
  //   teamsInfo!.put(index, todo);
  // }

  // void score10() {
  //   setState(() {
  //     _score1--;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(team!.teamname, _score1, team.foulone,
  //       team.teamname2, team.scoretwo, team.foultwo);
  //   teamsInfo!.put(index, todo);
  // }

  // void score21() {
  //   setState(() {
  //     _score2++;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(team!.teamname, team.scoreone, team.foulone,
  //       team.teamname2, _score2, team.foultwo);
  //   teamsInfo!.put(index, todo);
  // }

  // void score22() {
  //   setState(() {
  //     _score2 += 2;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(team!.teamname, team.scoreone, team.foulone,
  //       team.teamname2, _score2, team.foultwo);
  //   teamsInfo!.put(index, todo);
  // }

  // void score23() {
  //   setState(() {
  //     _score2 += 3;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(team!.teamname, team.scoreone, team.foulone,
  //       team.teamname2, _score2, team.foultwo);
  //   teamsInfo!.put(index, todo);
  // }

  // void score20() {
  //   setState(() {
  //     _score2--;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(team!.teamname, team.scoreone, team.foulone,
  //       team.teamname2, _score2, team.foultwo);
  //   teamsInfo!.put(index, todo);
  // }

  // void foul1() {
  //   setState(() {
  //     _foul++;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(team!.teamname, team.scoreone, _foul,
  //       team.teamname2, team.scoretwo, team.foultwo);
  //   teamsInfo!.put(index, todo);
  // }

  // void foul10() {
  //   setState(() {
  //     _foul--;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(team!.teamname, team.scoreone, _foul,
  //       team.teamname2, team.scoretwo, team.foultwo);
  //   teamsInfo!.put(index, todo);
  // }

  // void foul2() {
  //   setState(() {
  //     _foul2++;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(team!.teamname, team.scoreone, team.foulone,
  //       team.teamname2, team.scoretwo, _foul2);
  //   teamsInfo!.put(index, todo);
  // }

  // void foul20() {
  //   setState(() {
  //     _foul2--;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(team!.teamname, team.scoreone, team.foulone,
  //       team.teamname2, team.scoretwo, _foul2);
  //   teamsInfo!.put(index, todo);
  // }

  // void _refreash() {
  //   setState(() {
  //     _score1 = 0;
  //     _score2 = 0;
  //     _foul = 0;
  //     _foul2 = 0;
  //   });
  //   final TeamsInfo? team = teams!.getAt(index);
  //   TeamsInfo todo = TeamsInfo(team!.teamname, team.scoreone, team.foulone,
  //       team.teamname2, team.scoretwo, team.foultwo);
  //   teamsInfo!.put(index, todo);
  // }
