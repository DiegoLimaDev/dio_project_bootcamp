import 'package:flutter/material.dart';
import 'package:my_app/models/task2.model.dart';
import 'package:my_app/repositories/task2.repo.dart';
import 'package:my_app/shared/widgtes/page_title.dart';

class TaskHttpPage extends StatefulWidget {
  const TaskHttpPage({super.key});

  @override
  State<TaskHttpPage> createState() => _TaskHttpPageState();
}

class _TaskHttpPageState extends State<TaskHttpPage> {
  Task2Repo taskRepo = Task2Repo();
  TextEditingController taskController = TextEditingController();
  var _tasks = <TaskModel2>[];
  bool onlyNotDone = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  void getTasks() async {
    setState(() {
      loading = true;
    });
    _tasks = await taskRepo.getTasks(onlyNotDone);

    setState(() {
      loading = false;
    });
  }

  Future<void> _close() async {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: PageTitle(title: 'Tasks'),
          centerTitle: true,
        ),
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
                            var task = TaskModel2(
                                description: taskController.text,
                                isDone: false);
                            await taskRepo.addTask(task);
                            await _close();
                            setState(() {
                              getTasks();
                            });
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
                child: loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: _tasks.length,
                        itemBuilder: (BuildContext bc, int index) {
                          var task = _tasks[index];
                          return Dismissible(
                            onDismissed: (direction) async {
                              await taskRepo.deleteTask(task.objectId!);
                              getTasks();
                            },
                            key: Key(task.objectId!),
                            child: ListTile(
                                title: Text(task.description!),
                                trailing: Switch(
                                  onChanged: (bool value) async {
                                    task.isDone = value;
                                    await taskRepo.editTask(task);
                                    getTasks();
                                  },
                                  value: task.isDone!,
                                )),
                          );
                        }),
              ),
            ],
          ),
        ));
  }
}
