import 'package:flutter/material.dart';

class TaskModel {
  final String _id = UniqueKey().toString();
  String _description = '';
  bool _isDone = false;

  TaskModel(this._description, this._isDone);

  String get id => _id;

  String get description => _description;

  bool get isDone => _isDone;

  void set description(String description) => _description = description;

  void set isDone(bool isDone) => _isDone = isDone;
}
