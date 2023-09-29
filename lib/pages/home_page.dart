import 'package:flutter/material.dart';
import 'package:my_app/pages/images_assets.dart';
import 'package:my_app/pages/list_view.dart';
import 'package:my_app/pages/list_view_horizontal.dart';
import 'package:my_app/pages/task_page.dart';
import 'package:my_app/shared/widgtes/custom_drawer.dart';
import 'package:my_app/shared/widgtes/page_title.dart';
import 'package:my_app/pages/card_page.dart';

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
      drawer: const CustomDrawer(),
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
                children: const [
                  CardPage(),
                  ImageAssetsPage(),
                  ListViewPage(),
                  ListViewHorizontalPage(),
                  TaskPage()
                ]),
          ),
          BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                pageController.jumpToPage(value);
              },
              currentIndex: pagePosition,
              items: const [
                BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: 'Profile', icon: Icon(Icons.person)),
                BottomNavigationBarItem(
                    label: 'Profile', icon: Icon(Icons.settings)),
                BottomNavigationBarItem(
                    label: 'Profile', icon: Icon(Icons.abc_outlined)),
                BottomNavigationBarItem(
                    label: 'Profile', icon: Icon(Icons.abc_outlined))
              ])
        ],
      ),
    ));
  }
}
