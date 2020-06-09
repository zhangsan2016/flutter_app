
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterapp/check_flutterapp/pages/Index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: MaterialApp(
        title: '百姓生活++',
        // 去掉运行时 debug 的提示
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
       home: IndexPage(),


      ),
    );
  }
}
