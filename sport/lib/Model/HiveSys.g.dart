// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_sys.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeamsInfoAdapter extends TypeAdapter<TeamsInfo> {
  @override
  final int typeId = 0;

  @override
  TeamsInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeamsInfo(
      fields[0] as String,
      fields[1] as int?,
      fields[2] as int?,
      fields[3] as String?,
      fields[4] as int?,
      fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TeamsInfo obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.teamname)
      ..writeByte(1)
      ..write(obj.scoreone)
      ..writeByte(2)
      ..write(obj.foulone)
      ..writeByte(3)
      ..write(obj.teamname2)
      ..writeByte(4)
      ..write(obj.scoretwo)
      ..writeByte(5)
      ..write(obj.foultwo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamsInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HistoryAdapter extends TypeAdapter<History> {
  @override
  final int typeId = 1;

  @override
  History read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return History(
      fields[0] as String,
      fields[1] as int?,
      fields[2] as int?,
      fields[3] as String?,
      fields[4] as int?,
      fields[5] as int?,
      fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, History obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.teamone)
      ..writeByte(1)
      ..write(obj.scoreone)
      ..writeByte(2)
      ..write(obj.foulone)
      ..writeByte(3)
      ..write(obj.teamtwo)
      ..writeByte(4)
      ..write(obj.scoretwo)
      ..writeByte(5)
      ..write(obj.foultwo)
      ..writeByte(6)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
