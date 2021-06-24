import 'package:flutter/material.dart';
import 'package:flutter_app/pages/main/main_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          MainPage(),
          Container(
            child: Text("第二个页面"),
            height: 200,
            color: Colors.blue,
          ),
          Container(
            child: Text("第三个页面"),
            height: 300,
            color: Colors.green,
          ),
          Container(
            child: Text("第四个页面"),
            height: 400,
            color: Colors.purple,
          ),
        ],
        controller: _pageController,
        onPageChanged: (int index) => this.setState(() {
          currentIndex = index;
        }),
      ),
      floatingActionButton: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey[100],
                    Colors.grey[100],
                    Colors.transparent,
                    Colors.transparent
                  ],
                  stops: [
                    0.0,
                    0.5,
                    0.5,
                    1.0
                  ]),
              borderRadius: BorderRadius.circular(40)),
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 36,
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black87,
          onTap: (int index) => this.setState(() {
                currentIndex = index;
                _pageController.jumpToPage(currentIndex);
              }),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "首页"),
            BottomNavigationBarItem(
                icon: Icon(Icons.my_library_books_outlined), label: "分类"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_grocery_store_outlined), label: "购物车"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined), label: "我的"),
          ]),
    );
  }
}
