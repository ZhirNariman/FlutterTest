import 'package:hive/hive.dart';

part 'HiveSys.g.dart';

@HiveType(typeId: 0)
class TeamsInfo extends HiveObject {
  @HiveField(0)
  final String? teamname;

  @HiveField(1)
  final int? scoreone;

  @HiveField(2)
  final int? foulone;

  @HiveField(3)
  final String? teamname2;

  @HiveField(4)
  final int? scoretwo;

  @HiveField(5)
  final int? foultwo;

  TeamsInfo(this.teamname, this.scoreone, this.foulone, this.teamname2,
      this.scoretwo, this.foultwo);
}

@HiveType(typeId: 1)
class History {
  @HiveField(0)
  final String? teamone;

  @HiveField(1)
  final int? scoreone;

  @HiveField(2)
  final int? foulone;

  @HiveField(3)
  final String? teamtwo;

  @HiveField(4)
  final int? scoretwo;

  @HiveField(5)
  final int? foultwo;

  @HiveField(6)
  final String? date;

  History(this.teamone, this.scoreone, this.foulone, this.teamtwo,
      this.scoretwo, this.foultwo, this.date);
}
