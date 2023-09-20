import 'package:flutter/material.dart';
import 'package:my_app/components/page_title.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const PageTitle(title: 'Perfil'),
              centerTitle: true,
            ),
            body: const Center(child: Text('Dados cadastrais'))));
  }
}
