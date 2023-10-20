import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:my_app/pages/images_assets.dart';
import 'package:my_app/pages/list_view.dart';
import 'package:my_app/pages/list_view_horizontal.dart';
import 'package:my_app/pages/task_page.dart';
import 'package:my_app/pages/test_http.dart';
import 'package:my_app/shared/widgtes/custom_drawer.dart';
import 'package:my_app/shared/widgtes/page_title.dart';
import 'package:my_app/pages/card_page.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late var tabController =
      TabController(initialIndex: 0, length: 6, vsync: AnimatedGridState());
  int pagePosition = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('APP_TITLE'.tr()),
        centerTitle: true,
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(controller: tabController, children: const [
              CEPGetPage(),
              CardPage(),
              ImageAssetsPage(),
              ListViewPage(),
              ListViewHorizontalPage(),
              TaskPage()
            ]),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          activeColor: Colors.blue,
          color: Colors.black,
          backgroundColor: Colors.greenAccent,
          onTap: (value) {
            tabController.animateTo(value);
          },
          controller: tabController,
          items: const [
            TabItem(title: 'HTTP', icon: Icon(Icons.http)),
            TabItem(title: 'Home', icon: Icon(Icons.home)),
            TabItem(title: 'Profile', icon: Icon(Icons.person)),
            TabItem(title: 'Profile', icon: Icon(Icons.settings)),
            TabItem(title: 'Profile', icon: Icon(Icons.abc_outlined)),
            TabItem(title: 'Profile', icon: Icon(Icons.abc_outlined))
          ]),
    ));
  }
}
