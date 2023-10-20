import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_app/shared/widgtes/page_title.dart';

class AutoSizeTextPage extends StatefulWidget {
  const AutoSizeTextPage({super.key});

  @override
  State<AutoSizeTextPage> createState() => _AutoSizeTextPageState();
}

class _AutoSizeTextPageState extends State<AutoSizeTextPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const PageTitle(title: 'AutoSize Text'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: const Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: AutoSizeText(
              'Mussum Ipsum, cacilds vidis litro abertis. In elementis mé pra quem é amistosis quis leo. Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose. Praesent vel viverra nisi. Mauris aliquet nunc non turpis scelerisque, eget. Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo!',
              maxLines: 5,
            ),
          ),
        ),
      ),
    ));
  }
}
