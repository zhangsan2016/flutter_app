
import 'package:flutter/material.dart';
import 'package:flutterapp/check_flutterapp/pages/Index_page.dart';
import 'package:flutterapp/check_flutterapp/pages/category_page.dart';
import 'package:flutterapp/check_flutterapp/provide/category_goods_list.dart';
import 'package:flutterapp/check_flutterapp/provide/child_category.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  /*@override
  Widget build(BuildContext context) {
  //  Provider.debugCheckInvalidValueType = null;
    return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ChildCategory()),
         //  Provider<ChildCategory>(create: (_) => ChildCategory()),
          ],
         child:  Container(
           child: MaterialApp(
             title: '百姓生活++',
             // 去掉运行时 debug 的提示
             debugShowCheckedModeBanner: false,
             theme: ThemeData(
                 primaryColor: Colors.pink
             ),
             home: IndexPage(),


           ),
         ),
      );
  }*/

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChildCategory()),
        ChangeNotifierProvider(create: (_) => CategoryGoodsListProvide()),
      ],
      child: Consumer<ChildCategory>(
        builder: (context, counter, _) {
          return OKToast(
            child:  Container(
              child: MaterialApp(
                title: '百姓生活++',
                // 去掉运行时 debug 的提示
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primaryColor: Colors.pink
                ),
                home: IndexPage(),

              ),
            ),
          );
        },
      ),
    );
  }

 /* @override
  Widget build(BuildContext context) {
   // Provider.debugCheckInvalidValueType = null;
    return  Container(
        child: MaterialApp(
          title: '百姓生活++',
          // 去掉运行时 debug 的提示
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.pink),
          home: IndexPage(),
        ));


  }*/
}
