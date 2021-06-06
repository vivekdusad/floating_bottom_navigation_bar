import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task2/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: FloatingNavBar(
            items: [
              FloatingNavBarItem(
                  iconData: Icons.home_outlined, page: Page1(),),
              FloatingNavBarItem(
                  iconData: Icons.search,
                  page: Page2(),
                  ),
              FloatingNavBarItem(
                  iconData: Icons.history, page: Page3(),),
              FloatingNavBarItem(
                  iconData: Icons.pending_actions_outlined,
                  page: Page4(),
                  ),
            ],
          ),
        ));
  }
}

class FloatingNavBarItem {
  IconData iconData;

  Widget page;
  FloatingNavBarItem({
    required this.iconData,
    required this.page,
  });
}

class FloatingNavBar extends StatefulWidget {
  int index;
  List<FloatingNavBarItem> items;
  FloatingNavBar({
    Key? key,
    this.index = 0,
    required this.items,
  });

  @override
  _FloatingNavBarState createState() {
    return _FloatingNavBarState();
  }
}

class _FloatingNavBarState extends State<FloatingNavBar> {
  PageController _pageController = PageController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: widget.items.map((item) => item.page).toList(),
              onPageChanged: (index) => this._changePage(index),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 10,
                ),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient: LinearGradient(colors: [
                        const Color(0xFF3366FF),
                        const Color(0xFF00CCFF),
                      ])),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _widgetsBuilder(widget.items,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _floatingNavBarItem(
      FloatingNavBarItem item, int index) {
    return GestureDetector(
      onTap: () {
        _changePage(index);
      },
      child: Container(
        padding: EdgeInsets.all(6),
        width: 50,
        child: Icon(
          item.iconData,
          color: widget.index == index
              ? Colors.white
              : Colors.white.withOpacity(0.6),
        ),
      ),
    );
  }

  List<Widget> _widgetsBuilder(
      List<FloatingNavBarItem> items,) {
    List<Widget> _floatingNavBarItems = [];
    for (int i = 0; i < items.length; i++) {
      Widget item = this._floatingNavBarItem(items[i], i,);
      _floatingNavBarItems.add(item);
    }
    return _floatingNavBarItems;
  }

  _changePage(index) {
    _pageController.jumpToPage(index);
    setState(() {
      widget.index = index;
    });
  }
}
