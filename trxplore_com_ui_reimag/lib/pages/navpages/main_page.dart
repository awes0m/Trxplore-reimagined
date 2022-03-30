import 'package:flutter/material.dart';
import 'package:trxplore_com_ui_reimag/pages/navpages/bar_item_page.dart';
import 'package:trxplore_com_ui_reimag/pages/home_page.dart';
import 'package:trxplore_com_ui_reimag/pages/navpages/my_page.dart';
import 'package:trxplore_com_ui_reimag/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: onTap,
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false, //Hide selected label
          showUnselectedLabels: false, //Hide unselected label
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Bar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_sharp),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'My Profile',
            ),
          ],
        ));
  }
}
