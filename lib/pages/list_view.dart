import 'package:flutter/material.dart';
import 'package:my_app/shared/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Usuário 2"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("olá! Tudo bem?"),
              Text("09:00"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(value: "1", child: Text("opção 1")),
                const PopupMenuItem<String>(value: "2", child: Text("opção 2")),
                const PopupMenuItem<String>(value: "3", child: Text("opção 3"))
              ];
            },
          ),
          leading: Image.asset(AppImages.user2()),
        ),
        Image.asset(AppImages.user1()),
        Image.asset(AppImages.user2()),
        Image.asset(AppImages.user3()),
        Image.asset(AppImages.horizon1()),
        Image.asset(AppImages.horizon2()),
        Image.asset(AppImages.horizon3())
      ],
    );
  }
}
