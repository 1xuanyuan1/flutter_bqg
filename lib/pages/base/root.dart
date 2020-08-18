import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bqg/pages/home/home.dart';
import 'package:bqg/pages/recommend/recommend.dart';
import 'package:bqg/pages/bookcase/bookcase.dart';
import 'package:bqg/pages/my/my.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key,this.title}): super(key: key);
  final String title;
  @override
  _RootPageState createState() {
    return new _RootPageState();
  }

}

class _RootPageState extends State<RootPage> {
  int _tabIndex = 1;
  List<Image> _tabImage = [
    Image.asset("img/tab_bookshelf_n.png")
  ];
  List<Image> _tabActiveImage = [
    Image.asset("img/tab_bookshelf_n.png", color: Colors.blue,),
    Image.asset("img/tab_bookshelf_n.png", color: Colors.red,)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        children: <Widget>[
          BookCasePage(),
          HomePage(),
          RecommendPage(),
          MyPage()
        ],
        index: _tabIndex,
      ),
//      body: Center(
//        child: Text("test"),
//      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Colors.blue,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: _tabImage[0], title: Text("书架"), activeIcon: _tabActiveImage[1]),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text("书城")),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text("推荐")),
          BottomNavigationBarItem(icon: getTabIcon(3), title: Text("我的"))
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Image getTabIcon (int index) {
    return index == _tabIndex ? _tabActiveImage[0] : _tabImage[0];
  }
}