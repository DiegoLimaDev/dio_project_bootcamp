class TaskModel2 {
  String? _objectId;
  String? _description;
  bool? _isDone;
  String? _createdAt;
  String? _updatedAt;

  TaskModel2(
      {String? objectId,
      String? description,
      bool? isDone,
      String? createdAt,
      String? updatedAt}) {
    if (objectId != null) {
      this._objectId = objectId;
    }
    if (description != null) {
      this._description = description;
    }
    if (isDone != null) {
      this._isDone = isDone;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  String? get objectId => _objectId;
  set objectId(String? objectId) => _objectId = objectId;
  String? get description => _description;
  set description(String? description) => _description = description;
  bool? get isDone => _isDone;
  set isDone(bool? isDone) => _isDone = isDone;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  TaskModel2.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _description = json['description'];
    _isDone = json['isDone'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this._description;
    data['isDone'] = this._isDone;
    return data;
  }
}
