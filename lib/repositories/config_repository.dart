import 'package:hive/hive.dart';
import 'package:my_app/models/config_model.dart';

class ConfigRepo {
  static late Box _box;

  ConfigRepo._instance() {}

  static Future<ConfigRepo> load() async {
    if (Hive.isBoxOpen('configs')) {
      _box = Hive.box('configs');
    } else {
      _box = await Hive.openBox('configs');
    }

    return ConfigRepo._instance();
  }

  void save(ConfigModel configModel) {
    _box.put('configs', {
      'name': configModel.username,
      'height': configModel.height,
      'acceptsNotif': configModel.acceptsNotif,
      'darkTheme': configModel.darkTheme,
    });
  }

  ConfigModel getData() {
    var config = _box.get('configs');
    if (config == null) return ConfigModel.empty();
    return ConfigModel(config['name'], config['height'], config['acceptsNotif'],
        config['darkTheme']);
  }
}
