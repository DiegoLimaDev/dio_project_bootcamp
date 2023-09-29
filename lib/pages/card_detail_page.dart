import 'package:flutter/material.dart';
import 'package:my_app/models/card_detail_model.dart';

class CardDetailPage extends StatefulWidget {
  final CardDetailModel cardDetail;
  const CardDetailPage({super.key, required this.cardDetail});

  @override
  State<CardDetailPage> createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.cardDetail.getId(),
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color: Colors.red[800],
                    )),
                Center(
                    child:
                        Image.network(widget.cardDetail.getUrl(), width: 100)),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    widget.cardDetail.getTitle(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Text(
                    widget.cardDetail.getText(),
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
