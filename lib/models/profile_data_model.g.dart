// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileDataModelAdapter extends TypeAdapter<ProfileDataModel> {
  @override
  final int typeId = 0;

  @override
  ProfileDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileDataModel()
      ..name = fields[0] as String?
      ..birthday = fields[1] as DateTime?
      ..levelExp = fields[2] as String?
      ..langs = (fields[3] as List).cast<String>()
      ..expTime = fields[4] as int?
      ..salary = fields[5] as double?;
  }

  @override
  void write(BinaryWriter writer, ProfileDataModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.birthday)
      ..writeByte(2)
      ..write(obj.levelExp)
      ..writeByte(3)
      ..write(obj.langs)
      ..writeByte(4)
      ..write(obj.expTime)
      ..writeByte(5)
      ..write(obj.salary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
