import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/models/card_detail_model.dart';
import 'package:my_app/pages/card_detail_page.dart';
import 'package:my_app/repositories/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetailModel? cardDetail;
  CardDetailRepository cardDetailRepo = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    cardDetail = await cardDetailRepo.get();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: cardDetail == null
              ? const LinearProgressIndicator()
              : InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardDetailPage(
                                  cardDetail: cardDetail!,
                                )));
                  },
                  child: Hero(
                    tag: cardDetail!.getId(),
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.network(cardDetail!.getUrl(), width: 30),
                                Text(
                                  cardDetail!.getTitle(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              cardDetail!.getText(),
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                                width: double.infinity,
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.teal)),
                                    onPressed: () {},
                                    child: const Text(
                                      'Ler mais',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
