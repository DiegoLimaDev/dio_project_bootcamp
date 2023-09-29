import 'package:flutter/material.dart';
import 'package:my_app/models/task.dart';
import 'package:my_app/repositories/task_repository.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TaskRepository taskRepo = TaskRepository();
  TextEditingController taskController = TextEditingController();
  var _tasks = <TaskModel>[];
  bool onlyNotDone = false;

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  void getTasks() async {
    if (onlyNotDone) {
      _tasks = await taskRepo.getNotDoneTask();
    } else {
      _tasks = await taskRepo.getTasks();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            taskController.text = '';
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text('Adicionar tarefa'),
                    content: TextField(controller: taskController),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            await taskRepo
                                .addTask(TaskModel(taskController.text, false));
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: const Text('Salvar')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancelar'))
                    ],
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filtrar apenas não concluídos',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Switch(
                          value: onlyNotDone,
                          onChanged: (bool value) {
                            onlyNotDone = value;
                            getTasks();
                          })
                    ],
                  )),
              Expanded(
                child: ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var task = _tasks[index];
                      return Dismissible(
                        onDismissed: (direction) async {
                          await taskRepo.removeTask(task.id);
                          getTasks();
                        },
                        key: Key(task.id),
                        child: ListTile(
                            title: Text(task.description),
                            trailing: Switch(
                              onChanged: (bool value) async {
                                await taskRepo.editTask(task.id, value);
                                getTasks();
                                setState(() {});
                              },
                              value: task.isDone,
                            )),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
