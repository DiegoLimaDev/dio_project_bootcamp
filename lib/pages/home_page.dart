import 'package:flutter/material.dart';
import 'package:my_app/components/page_title.dart';
import 'package:my_app/pages/login_page.dart';
import 'package:my_app/pages/page1.dart';
import 'package:my_app/pages/page2.dart';
import 'package:my_app/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(initialPage: 0);
  int pagePosition = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const PageTitle(title: 'My App'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Text('Profile',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(thickness: 1),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Text('Settings',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(thickness: 1),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Text('Sair',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    pagePosition = value;
                  });
                },
                children: const [Page1(), Page2()]),
          ),
          BottomNavigationBar(
              onTap: (value) {
                pageController.jumpToPage(value);
              },
              currentIndex: pagePosition,
              items: const [
                BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: 'Profile', icon: Icon(Icons.person))
              ])
        ],
      ),
    ));
  }
}
