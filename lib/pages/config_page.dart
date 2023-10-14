import 'package:flutter/material.dart';
import 'package:my_app/shared/widgtes/page_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String? username;
  double? height;
  bool acceptsPush = false;
  bool isDarkTheme = false;
  late SharedPreferences storage;

  final _keyUsername = 'keyUsername';
  final _keyHeight = 'keyHeight';
  final _keyPushs = 'keyPushs';
  final _keyDarkTheme = 'keyDarkTheme';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      usernameController.text = storage.getString(_keyUsername) ?? '';
      heightController.text = (storage.getDouble(_keyHeight) ?? 0).toString();
      acceptsPush = storage.getBool(_keyPushs) ?? false;
      isDarkTheme = storage.getBool(_keyDarkTheme) ?? false;
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
        title: const PageTitle(title: 'Configurações'),
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
            value: acceptsPush,
            onChanged: (value) {
              acceptsPush = value;
              setState(() {});
            }),
        SwitchListTile(
            title: const Text(
              'Tema escuro',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            value: isDarkTheme,
            onChanged: (value) {
              isDarkTheme = value;
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
              await storage.setString(_keyUsername, usernameController.text);

              try {
                await storage.setDouble(
                    _keyHeight, double.parse(heightController.text));
              } catch (e) {
                _dialog();
                return;
              }
              await storage.setBool(_keyPushs, acceptsPush);
              await storage.setBool(_keyDarkTheme, isDarkTheme);
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
