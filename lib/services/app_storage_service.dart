import 'package:shared_preferences/shared_preferences.dart';

enum StorageKeys {
  keyPersonalDataName,
  keyPersonalDataBirthday,
  keyPersonalDataExperience,
  keyPersonalDataLangs,
  keyPersonalDataExpTime,
  keyPersonalDataSalary;
}

class AppStorageService {
  Future<void> setProfileDataName(String name) async {
    await _setString(StorageKeys.keyPersonalDataName.toString(), name);
  }

  Future<String> getProfileDataName() async {
    return _getString(StorageKeys.keyPersonalDataName.toString());
  }

  Future<void> setProfileDataBirthday(DateTime birthday) async {
    await _setString(
        StorageKeys.keyPersonalDataBirthday.toString(), birthday.toString());
  }

  Future<String> getProfileDataBirthday() async {
    return _getString(StorageKeys.keyPersonalDataBirthday.toString());
  }

  Future<void> setProfileDataExperience(String exp) async {
    await _setString(
        StorageKeys.keyPersonalDataExperience.toString(), exp.toString());
  }

  Future<String> getProfileDataExperience() async {
    return _getString(StorageKeys.keyPersonalDataExperience.toString());
  }

  Future<void> setProfileDataLangs(List<String> langs) async {
    await _setStringList(StorageKeys.keyPersonalDataLangs.toString(), langs);
  }

  Future<List<String>> getProfileDataLangs() async {
    return _getStringList(StorageKeys.keyPersonalDataLangs.toString());
  }

  Future<void> setProfileDataExpTime(int value) async {
    await _setInt(StorageKeys.keyPersonalDataExpTime.toString(), value);
  }

  Future<int> getProfileDataExpTime() async {
    return _getInt(StorageKeys.keyPersonalDataExpTime.toString());
  }

  Future<void> setProfileDataSalary(double value) async {
    await _setDouble(StorageKeys.keyPersonalDataSalary.toString(), value);
  }

  Future<double> getProfileDataSalary() async {
    return _getDouble(StorageKeys.keyPersonalDataSalary.toString());
  }

  Future<void> _setString(String key, String value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(key, value);
  }

  Future<String> _getString(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(key) ?? '';
  }

  Future<void> _setStringList(String key, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList(key, values);
  }

  Future<List<String>> _getStringList(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(key) ?? [];
  }

  Future<void> _setInt(String key, int value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setInt(key, value);
  }

  Future<int> _getInt(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(key) ?? 0;
  }

  Future<void> _setDouble(String key, double value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(key, value);
  }

  Future<double> _getDouble(String key) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(key) ?? 0;
  }
}
