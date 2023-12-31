import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_app/models/heroes_model.dart';
import 'package:my_app/pages/auto_size_text.page.dart';
import 'package:my_app/pages/camera.page.dart';
import 'package:my_app/pages/config_page.dart';
import 'package:my_app/pages/config_page_hive.dart';
import 'package:my_app/pages/heroes_page.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/pages/percent_indicator.page.dart';
import 'package:my_app/pages/posts_page.dart';
import 'package:my_app/pages/profile_page.dart';
import 'package:my_app/pages/profile_page_hive.dart';
import 'package:my_app/pages/qr_code.page.dart';
import 'package:my_app/pages/random_numbers_hive.dart';
import 'package:my_app/pages/random_numbers_page.dart';
import 'package:my_app/pages/task_http.page.dart';
import 'package:my_app/repositories/marvel/heroes_repository.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  get accountEmail => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          title: const Text(
                            'Camera',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          leading: const Icon(Icons.camera),
                          onTap: () => Navigator.pop(context),
                        ),
                        ListTile(
                          title: const Text('Galeria',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          leading: const Icon(Icons.picture_in_picture),
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.orange),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      'https://seeklogo.com/images/S/svg-logo-C2C6DE140E-seeklogo.com.png'),
                ),
                accountName: const Text('Diego'),
                accountEmail: const Text('diego@diego.com')),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Row(
                children: [
                  FaIcon(FontAwesomeIcons.user, size: 20),
                  Text('Profile',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(thickness: 1),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => const ConfigPageHive()));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Row(
                children: [
                  Icon(Icons.settings),
                  Text('Settings',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(thickness: 1),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: const Wrap(
                        children: [
                          Center(
                            child: Text(
                              'Termos de privacidade',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    );
                  });
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Row(
                children: [
                  Icon(Icons.info),
                  Text('Termos de uso e privacidade',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(thickness: 1),
          InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const RandomNumbersHive()));
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Row(
                  children: [
                    Icon(Icons.numbers),
                    Text('Gerador de números',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          const Divider(thickness: 1),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PostsPage()));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Row(
                children: [
                  Icon(Icons.post_add),
                  Text('Posts',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(thickness: 1),
          InkWell(
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const HeroesPage()));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Row(
                children: [
                  Icon(Icons.help),
                  Text('Heróis',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(thickness: 1),
          InkWell(
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const TaskHttpPage()));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Row(
                children: [
                  Icon(Icons.help),
                  Text('Tasks HTTP',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(thickness: 1),
          InkWell(
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const PercentIndicatorPage()));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Row(
                children: [
                  Icon(Icons.help),
                  Text('Percent Indicator',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(thickness: 1),
          InkWell(
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AutoSizeTextPage()));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Row(
                children: [
                  FaIcon(FontAwesomeIcons.textWidth),
                  Text('AutoSize Text',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const Divider(thickness: 1),
          InkWell(
            onTap: () async {
              var f = NumberFormat('#,###.0#', 'en_BR');
              var fBr = NumberFormat('#,###.0#', 'pt_BR');
              print(context.locale.toString());
              await context.setLocale(const Locale('en', 'US'));
              print(context.locale.toString());
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Row(
                children: [
                  FaIcon(FontAwesomeIcons.itunesNote),
                  Text('Intl',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 1),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const QRCodePage()));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Row(
                children: [
                  FaIcon(FontAwesomeIcons.qrcode),
                  Text('Qr Code Reader',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 1),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const CameraPage()));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Row(
                children: [
                  FaIcon(FontAwesomeIcons.camera),
                  Text('Camera',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 1),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      actionsAlignment: MainAxisAlignment.spaceAround,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => const LoginPage()));
                            },
                            child: const Text(
                              'Sim',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Não',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ))
                      ],
                      content: const Wrap(children: [
                        Text(
                          'Deseja sair do app?',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ]),
                    );
                  }); // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Row(
                children: [
                  Icon(Icons.exit_to_app),
                  Text('Sair',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
