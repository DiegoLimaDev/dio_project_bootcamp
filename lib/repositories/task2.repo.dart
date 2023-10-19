import 'package:my_app/interfaces/task2.interface.dart';
import 'package:my_app/models/task2.model.dart';
import 'package:my_app/utils/back4app_custom_dio.dart';

class Task2Repo implements ITask2Repo {
  final _dio = Task2CustomDio();

  @override
  Future<List<TaskModel2>> getTasks(bool onlyNotDone) async {
    var res = await _dio.customDio.get('/tasks');
    if (res.statusCode == 200 && onlyNotDone) {
      return (res.data['results'] as List)
          .map((e) => TaskModel2.fromJson(e))
          .where((element) => element.isDone == false)
          .toList();
    }
    if (res.statusCode == 200) {
      return (res.data['results'] as List)
          .map((e) => TaskModel2.fromJson(e))
          .toList();
    }
    return [];
  }

  @override
  Future<void> addTask(TaskModel2 task) async {
    try {
      await _dio.customDio.post('/tasks', data: task.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> editTask(TaskModel2 task) async {
    try {
      await _dio.customDio.put('/tasks/${task.objectId}', data: task.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String objectId) async {
    try {
      await _dio.customDio.delete('/tasks/$objectId', data: {});
    } catch (e) {
      rethrow;
    }
  }
}
