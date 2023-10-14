class ConfigModel {
  String _username = '';
  double _height = 0;
  bool _acceptsNotif = false;
  bool _darkTheme = false;

  ConfigModel.empty() {
    _username = '';
    _height = 0;
    _acceptsNotif = false;
    _darkTheme = false;
  }

  ConfigModel(
      this._username, this._height, this._acceptsNotif, this._darkTheme);

  String get username => _username;

  set username(String value) => _username = value;

  double get height => _height;

  set height(double value) => _height = value;

  bool get acceptsNotif => _acceptsNotif;

  set acceptsNotif(bool value) => _acceptsNotif = value;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) => _darkTheme = value;
}
