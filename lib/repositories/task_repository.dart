import 'package:my_app/models/task.dart';

class TaskRepository {
  final List<TaskModel> _tasks = [];

  Future<void> addTask(TaskModel task) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.add(task);
  }

  Future<void> editTask(String id, bool isDone) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.where((element) => element.id == id).first.isDone = isDone;
  }

  Future<List<TaskModel>> getTasks() async {
    await Future.delayed(const Duration(seconds: 1));
    return _tasks;
  }

  Future<List<TaskModel>> getNotDoneTask() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks.where((element) => element.isDone == false).toList();
  }

  Future<void> removeTask(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.remove(_tasks.where((element) => element.id == id).first);
  }
}
