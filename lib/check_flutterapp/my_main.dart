
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/check_flutterapp/pages/Index_page2.dart';
import 'package:flutterapp/check_flutterapp/provide/cart.dart';
import 'package:flutterapp/check_flutterapp/provide/category_goods_list.dart';
import 'package:flutterapp/check_flutterapp/provide/child_category.dart';
import 'package:flutterapp/check_flutterapp/provide/currentIndex.dart';
import 'package:flutterapp/check_flutterapp/provide/details_Info.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'config/application.dart';
import 'config/routes.dart';

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

    final router = Router();
    Routes.configureRoutes(router);
    Application.router=router;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChildCategory()),
        ChangeNotifierProvider(create: (_) => CategoryGoodsListProvide()),
        ChangeNotifierProvider(create: (_) => DetailsInfoProvide()),
        ChangeNotifierProvider(create: (_) => CartProvide()),
        ChangeNotifierProvider(create: (_) => CurrentIndexProvide()),
      ],
      child: Consumer<ChildCategory>(
        builder: (context, counter, _) {
          return OKToast(
            child:  Container(
              child: MaterialApp(
                onGenerateRoute: Application.router.generator,
                title: '百姓生活++',
                // 去掉运行时 debug 的提示
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primaryColor: Colors.pink
                ),
                home: IndexPage2(),

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
