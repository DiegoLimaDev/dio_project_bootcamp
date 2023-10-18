class HeroesModel {
  int? _id;
  String? _name;
  String? _description;
  String? _modified;
  Thumbnail? _thumbnail;

  HeroesModel(
      {int? id,
      String? name,
      String? description,
      String? modified,
      Thumbnail? thumbnail}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (modified != null) {
      this._modified = modified;
    }
    if (thumbnail != null) {
      this._thumbnail = thumbnail;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get modified => _modified;
  set modified(String? modified) => _modified = modified;
  Thumbnail? get thumbnail => _thumbnail;
  set thumbnail(Thumbnail? thumbnail) => _thumbnail = thumbnail;

  HeroesModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _modified = json['modified'];
    _thumbnail = json['thumbnail'] != null
        ? new Thumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['description'] = this._description;
    data['modified'] = this._modified;
    if (this._thumbnail != null) {
      data['thumbnail'] = this._thumbnail!.toJson();
    }
    return data;
  }
}

class Thumbnail {
  String? _path;
  String? _extension;

  Thumbnail({String? path, String? extension}) {
    if (path != null) {
      this._path = path;
    }
    if (extension != null) {
      this._extension = extension;
    }
  }

  String? get path => _path;
  set path(String? path) => _path = path;
  String? get extension => _extension;
  set extension(String? extension) => _extension = extension;

  Thumbnail.fromJson(Map<String, dynamic> json) {
    _path = json['path'];
    _extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this._path;
    data['extension'] = this._extension;
    return data;
  }
}
