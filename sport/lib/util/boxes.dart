import 'package:hive/hive.dart';
import 'package:sport/Model/hive_sys.dart';

class Boxes {
  static Box<TeamsInfo> getTeamInfo() =>
  
      Hive.box<TeamsInfo>('teaminfo');
      
      

  static Box<History> getHistory() =>
      Hive.box<History>('history');
}