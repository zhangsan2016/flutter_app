import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/check_flutterapp/entity/category_big_model.dart';
import 'package:flutterapp/check_flutterapp/service/service_method.dart';



class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('分类界面'),
      ),
    );
  }
}

class LeftCatgegoryNav extends StatefulWidget {
  @override
  _LeftCatgegoryNavState createState() => _LeftCatgegoryNavState();
}

/**
 * 左侧大类导航
 */
class _LeftCatgegoryNavState extends State<LeftCatgegoryNav> {
  List list = [];

  @override
  Widget build(BuildContext context) {
    return Container(
    //  child:,
    );
  }

  /**
   * 根据 index 获取 json中的单个类别
   */
  Widget _leftInkWell(int index){
     return InkWell(
       onTap: (){},
       child: Container(
         height: ScreenUtil().setHeight(100),
         padding: EdgeInsets.only(left: 10,top: 20),
         decoration: BoxDecoration(
           color: Colors.white,
           border:Border(
             bottom: BorderSide(width: 1,color: Colors.black12)
           )
         ),
         child: Text(list[index].mallCategoryId),
       ),
     );
  }

  void _getCategory()async{
    await request('getCategory').then((val){
      var data = json.decode(val.toString());
      CategoryBigModel category = CategoryBigModel.fromJson(data);
      setState(() {
        list = category.data;
      });
    });
  }
}











