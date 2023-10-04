import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/services/random_number.dart';
import 'package:my_app/shared/widgtes/page_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomNumbersPage extends StatefulWidget {
  const RandomNumbersPage({super.key});

  @override
  State<RandomNumbersPage> createState() => _RandomNumbersPageState();
}

class _RandomNumbersPageState extends State<RandomNumbersPage> {
  var numbers = <String>[];
  late SharedPreferences storage;
  final keyNumberList = "number_list";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    getNumber();
  }

  void getNumber() async {
    storage = await SharedPreferences.getInstance();
    var numberList = storage.getStringList(keyNumberList);
    await Future.delayed(const Duration(seconds: 1));
    numbers = numberList ?? [];
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const PageTitle(title: 'Gerador de números'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: LinearProgressIndicator(),
            )
          : ListView(children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Column(
                    children: numbers.isEmpty
                        ? [const Text('Não há valores gerados')]
                        : numbers.map((String value) {
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ));
                          }).toList()),
              ),
            ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            storage = await SharedPreferences.getInstance();
            int number = CreateRandomNumberService.randomNumb(1000);
            numbers.add(number.toString());
            setState(() {});
            storage.setStringList(keyNumberList, numbers);
          },
          child: const Icon(Icons.add)),
    ));
  }
}
