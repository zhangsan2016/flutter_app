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

    return Scaffold(
      appBar: AppBar(title: Text('商品分类'),),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCatgegoryNav(),
          ],
        ),
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
  void initState() {
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))
      ),
      child: ListView.builder(
          itemCount: list.length, itemBuilder: (context, index) {
        return _leftInkWell(index);
      }),
    );
  }

  /**
   * 根据 index 获取 json中的单个类别
   */
  Widget _leftInkWell(int index) {
    return InkWell(
      onTap: () {

      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 1, color: Colors.black12)
            )
        ),
        child: Text(list[index].mallCategoryId,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),),
      ),
    );
  }

  void _getCategory() async {
    await request('getCategory').then((val) {
      var data = json.decode(val.toString());
     // CategoryBigModel category = CategoryBigModel.fromJson(data);
      setState(() {
        // list = category.data;
        List<CategoryModel> data = List<CategoryModel>();
        for (int i = 0; i < 30; i++) {
          CategoryModel categoryModel = CategoryModel(mallCategoryId: '类型$i');
          data.add(categoryModel);
        }
        list = data;
      });
    });
  }
}











