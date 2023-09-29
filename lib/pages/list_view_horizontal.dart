import 'package:flutter/material.dart';
import 'package:my_app/shared/app_images.dart';

class ListViewHorizontalPage extends StatefulWidget {
  const ListViewHorizontalPage({super.key});

  @override
  State<ListViewHorizontalPage> createState() => _ListViewHorizontalPageState();
}

class _ListViewHorizontalPageState extends State<ListViewHorizontalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Card(elevation: 8, child: Image.asset(AppImages.horizon1())),
              Card(elevation: 8, child: Image.asset(AppImages.horizon2())),
              Card(elevation: 8, child: Image.asset(AppImages.horizon3()))
            ]),
          ),
          Expanded(flex: 3, child: Container())
        ],
      ),
    );
  }
}
