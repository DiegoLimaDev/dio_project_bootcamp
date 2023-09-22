import 'package:flutter/material.dart';

class PageTitle extends StatefulWidget {
  final String title;
  const PageTitle({super.key, required this.title});

  @override
  State<PageTitle> createState() => _PageTitleState();
}

class _PageTitleState extends State<PageTitle> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }
}
