import 'package:flutter/material.dart';
import 'package:my_app/shared/widgtes/page_title.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PercentIndicatorPage extends StatefulWidget {
  const PercentIndicatorPage({super.key});

  @override
  State<PercentIndicatorPage> createState() => _PercentIndicatorPageState();
}

class _PercentIndicatorPageState extends State<PercentIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const PageTitle(title: 'Percent Indicator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 5,
                  percent: 1,
                  center: const Text("100%"),
                  progressColor: Colors.green,
                )
              ]),
        ),
      ),
    ));
  }
}
