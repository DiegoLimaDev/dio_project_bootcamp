import 'package:hive/hive.dart';

part 'profile_data_model.g.dart';

@HiveType(typeId: 0)
class ProfileDataModel extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  DateTime? birthday;

  @HiveField(2)
  String? levelExp;

  @HiveField(3)
  List<String> langs = [];

  @HiveField(4)
  int? expTime;

  @HiveField(5)
  double? salary;

  ProfileDataModel();

  ProfileDataModel.empty() {
    name = '';
    birthday = null;
    levelExp = '';
    langs = [];
    expTime = 0;
    salary = 0;
  }
}
