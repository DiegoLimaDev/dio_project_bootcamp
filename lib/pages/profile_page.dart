import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/repositories/languages_repository.dart';
import 'package:my_app/repositories/nivel_repository.dart';
import 'package:my_app/services/generate_list.dart';
import 'package:my_app/shared/widgtes/page_title.dart';
import 'package:my_app/shared/widgtes/text_label.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController birthDayController = TextEditingController(text: '');
  DateTime currentDate = DateTime.now();
  NivelRepository levelRepo = NivelRepository();
  var levels = [];
  LanguageRepository langRepo = LanguageRepository();
  var langs = [];
  var selectedLevel = '';
  var selectedLangs = [];
  double salary = 0;
  int experienceTime = 0;
  bool saving = false;

  @override
  void initState() {
    levels = levelRepo.returnNivels();
    langs = langRepo.returnLanguages();
    super.initState();
  }

  List<DropdownMenuItem> returnItens(int maxAmount) {
    var list = GenerateList.generateList(maxAmount);
    return list
        .map((item) => DropdownMenuItem(
            value: item, child: Text('${item.toString()} anos')))
        .toList();
  }

  void checkValidity() {
    if (nameController.text.trim().length < 3) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Nome inválido')));
      return;
    }
    if (birthDayController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data de nascimento inválido')));
      return;
    }
    if (selectedLevel.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nível de experiência inválido')));
      return;
    }
    if (selectedLangs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Selecione ao menos uma linguagem')));
      return;
    }
    if (salary == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pretensão salarial requerida')));
      return;
    }

    setState(() {
      saving = true;
      Timer(
          const Duration(seconds: 3),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const PageTitle(title: 'Perfil'),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: saving
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        const TextLabel(
                          text: "Nome",
                        ),
                        TextField(controller: nameController),
                        const TextLabel(
                          text: "Data de nascimento",
                        ),
                        TextField(
                          controller: birthDayController,
                          readOnly: true,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.calendar_month)),
                          onTap: () async {
                            var date = await showDatePicker(
                                context: context,
                                initialDate: currentDate,
                                firstDate: DateTime(1900, 1, 1),
                                lastDate: currentDate);
                            if (date != null) {
                              birthDayController.text = date.toString();
                            }
                          },
                        ),
                        const TextLabel(text: 'Nível de Experiência'),
                        Column(
                            children: levels
                                .map((item) => RadioListTile(
                                      title: Text(item),
                                      selected: selectedLevel == item,
                                      value: item,
                                      groupValue: selectedLevel,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedLevel = value.toString();
                                        });
                                      },
                                    ))
                                .toList()),
                        const TextLabel(text: 'Linguagens'),
                        Column(
                            children: langs
                                .map(
                                  (item) => CheckboxListTile(
                                    title: Text(item),
                                    value: selectedLangs.contains(item)
                                        ? true
                                        : false,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value!) {
                                          selectedLangs.add(item);
                                        } else {
                                          selectedLangs.remove(item);
                                        }
                                      });
                                    },
                                  ),
                                )
                                .toList()),
                        TextLabel(
                            text:
                                'Pretensão salarial: R\$ ${salary.toStringAsFixed(2)}'),
                        Slider(
                          label: 'R\$$salary',
                          min: 0,
                          max: 10000,
                          value: salary,
                          onChanged: (double value) {
                            setState(() {
                              salary = value;
                            });
                          },
                        ),
                        const TextLabel(text: 'Tempo de Experiência'),
                        DropdownButton(
                          value: experienceTime,
                          items: returnItens(5),
                          onChanged: (value) {
                            setState(() {
                              experienceTime = value!;
                            });
                          },
                          isExpanded: true,
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: TextButton(
                              onPressed: () => checkValidity(),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.green)),
                              child: const Text('Salvar',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                        ),
                      ],
                    ),
            )));
  }
}
