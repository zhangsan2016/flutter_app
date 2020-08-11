import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterapp/check_flutterapp/provide/currentIndex.dart';
import 'package:provider/provider.dart';

import 'cart_page/cart_page.dart';
import 'category_page.dart';
import 'home_page2.dart';
import 'member_page.dart';

class IndexPage2 extends StatelessWidget {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心')),
  ];

  final List<Widget> tabBodie = [
    HomePage2(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];


  @override
  Widget build(BuildContext context) {
    // 使用flutter界面尺寸框架
    ScreenUtil.init(context, width: 750, height: 1334);
    return Consumer < CurrentIndexProvide > (builder: (context, counter, _)
    {
      int currentIndex = Provider.of<CurrentIndexProvide>(context, listen: false).currentIndex;
      return Scaffold(
        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabs,
          onTap: ((index) {
            Provider.of<CurrentIndexProvide>(context, listen: false)
                .changeIndex(index);
          }),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: tabBodie,
        ),
      );
    });
  }


}


