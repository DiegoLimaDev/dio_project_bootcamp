import 'package:my_app/models/task2.model.dart';

abstract class ITask2Repo {
  Future<List<TaskModel2>> getTasks(bool onlyNotDone);

  Future<void> addTask(TaskModel2 task);

  Future<void> editTask(TaskModel2 task);

  Future<void> deleteTask(String objectId);
}
