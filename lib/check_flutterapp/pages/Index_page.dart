import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'cart_page.dart';
import 'category_page.dart';
import 'home_page.dart';
import 'home_page2.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心')),
  ];

  @override
  void initState() {
    // TODO: implement initState
    currentPage = tabBodie[currentIndex];
    super.initState();
  }

  final List<Widget> tabBodie = [
    HomePage2(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  Widget build(BuildContext context) {
    // 使用flutter界面尺寸框架
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: ((index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodie[currentIndex];
          });
        }),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodie,
      ),
    );
  }
}
