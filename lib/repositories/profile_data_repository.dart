import 'package:hive/hive.dart';
import 'package:my_app/models/profile_data_model.dart';

class ProfileDataRepo {
  static late Box _box;
  static String profileDataKey = 'profileData';

  ProfileDataRepo._instance();

  static Future<ProfileDataRepo> load() async {
    if (Hive.isBoxOpen(profileDataKey)) {
      _box = Hive.box(profileDataKey);
    } else {
      _box = await Hive.openBox(profileDataKey);
    }

    return ProfileDataRepo._instance();
  }

  save(ProfileDataModel profileDataModel) {
    _box.put(profileDataKey, profileDataModel);
  }

  ProfileDataModel getData() {
    var data = _box.get(profileDataKey);
    if (data == null) {
      return ProfileDataModel.empty();
    } else {
      return data;
    }
  }
}
