import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_app/services/random_number.dart';
import 'package:my_app/shared/widgtes/page_title.dart';

class RandomNumbersHive extends StatefulWidget {
  const RandomNumbersHive({super.key});

  @override
  State<RandomNumbersHive> createState() => _RandomNumbersHiveState();
}

class _RandomNumbersHiveState extends State<RandomNumbersHive> {
  var myNumber;
  late Box boxRandomNumbers;
  final keyNumberList = "number_list";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    loadData();
  }

  void loadData() async {
    if (Hive.isBoxOpen('box_random_numbers')) {
      boxRandomNumbers = Hive.box('box_random_numbers');
    } else {
      boxRandomNumbers = await Hive.openBox('box_random_numbers');
    }
    var number = boxRandomNumbers.get(keyNumberList);
    await Future.delayed(const Duration(seconds: 1));
    myNumber = number ?? 0;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const PageTitle(title: 'Gerador de números - Hive'),
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
                  // children: numbers.map((String value) {
                  //         return Padding(
                  //             padding:
                  //                 const EdgeInsets.symmetric(vertical: 8),
                  //             child: Text(
                  //               value,
                  //               style: const TextStyle(
                  //                   fontSize: 20,
                  //                   fontWeight: FontWeight.w600),
                  //             ));
                  //       }).toList()),
                  children: [Text(myNumber.toString())],
                ),
              )
            ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            myNumber = CreateRandomNumberService.randomNumb(1000);
            // numbers.add(number.toString());
            boxRandomNumbers.put(keyNumberList, myNumber);
            setState(() {});
          },
          child: const Icon(Icons.add)),
    ));
  }
}
