import 'package:flutter/material.dart';
import 'package:my_app/models/config_model.dart';
import 'package:my_app/repositories/config_repository.dart';
import 'package:my_app/shared/widgtes/page_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPageHive extends StatefulWidget {
  const ConfigPageHive({super.key});

  @override
  State<ConfigPageHive> createState() => _ConfigPageHiveState();
}

class _ConfigPageHiveState extends State<ConfigPageHive> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  late ConfigRepo configRepo;
  ConfigModel configModel = ConfigModel.empty();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    configRepo = await ConfigRepo.load();
    configModel = configRepo.getData();
    setState(() {
      usernameController.text = configModel.username;
      heightController.text = configModel.height.toString();
    });
  }

  void _close() {
    Navigator.pop(context);
  }

  Future<dynamic> _dialog() {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Erro'),
            content: const Text('Favor informar uma altura válida'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Fechar'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const PageTitle(title: 'Configurações - Hive'),
        centerTitle: true,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: const InputDecoration(hintText: 'Nome de usuário'),
            controller: usernameController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Altura'),
            controller: heightController,
          ),
        ),
        SwitchListTile(
            title: const Text(
              'Receber notificações',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            value: configModel.acceptsNotif,
            onChanged: (value) {
              configModel.acceptsNotif = value;
              setState(() {});
            }),
        SwitchListTile(
            title: const Text(
              'Tema escuro',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            value: configModel.darkTheme,
            onChanged: (value) {
              configModel.darkTheme = value;
              setState(() {});
            }),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () async {
              FocusManager.instance.primaryFocus?.unfocus();
              configModel.username = usernameController.text;

              try {
                configModel.height = double.parse(heightController.text);
              } catch (e) {
                _dialog();
                return;
              }

              configRepo.save(configModel);
              _close();
            },
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(2),
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            child: const Text('Salvar',
                style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        )
      ]),
    ));
  }
}
