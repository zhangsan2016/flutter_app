import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/check_flutterapp/entity/category_big_model.dart';
import 'package:flutterapp/check_flutterapp/entity/category_goods_list_model.dart';
import 'package:flutterapp/check_flutterapp/provide/child_category.dart';
import 'package:flutterapp/check_flutterapp/service/service_method.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品分类'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            // 左侧导航
            LeftCatgegoryNav(),
            // 右侧导航
            Column(
              children: <Widget>[
                RightCategoryNav(),
                CategoryGoodsList(),
              ],
            ),
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
  List<CategoryModel> list = [];

  @override
  Future<void> initState() {
    super.initState();
    _getCategory();
  }

  @override
  Widget build(BuildContext context) {
    final childCategory = Provider.of<ChildCategory>(context);
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
          itemCount: childCategory.childCategoryList.length != 0
              ? childCategory.childCategoryList.length
              : 0,
          itemBuilder: (context, index) {
            return _leftInkWell(
                Provider.of<ChildCategory>(context)
                    .childCategoryList[index]
                    .mallCategoryId,
                context,
                index);
          }),
    );
  }

  void _getCategory() {
    request('getCategory').then((val) {
      var data = json.decode(val.toString());
      // CategoryBigModel category = CategoryBigModel.fromJson(data);
      List<CategoryModel> categoryModels = List<CategoryModel>();
      for (int i = 0; i < 15; i++) {
        CategoryModel categoryModel = CategoryModel(mallCategoryId: '类型 $i');
        categoryModel.bxMallSubDto = new List<BxMallSubDto>();


        // 添加“全部”在最前
        BxMallSubDto all = new BxMallSubDto();
        all.mallSubId = "00";
        all.mallCategoryId = "00";
        all.comments = 'null';
        all.mallSubName = '全部';
        categoryModel.bxMallSubDto = [all];

        // 右边菜单随机长度
        int leng = 3 + Random().nextInt(10);
        for (int b = 0; b < leng; b++) {
          BxMallSubDto bxMallSubDto = new BxMallSubDto();
          bxMallSubDto.mallSubName = '${categoryModel.mallCategoryId}$b';
          categoryModel.bxMallSubDto.add(bxMallSubDto);
        }

        categoryModels.add(categoryModel);
      }
      setState(() {
        list = categoryModels;
        Provider.of<ChildCategory>(context, listen: false)
            .getchildCategory(list);
      });
    });

    // list = category.data;
  }

  /**
   * 根据 index 获取 json中的单个类别
   */
  Widget _leftInkWell(String type, BuildContext context, int index) {
    int selected = Provider.of<ChildCategory>(context).selected;
    bool isClick = selected == index;
    return InkWell(
      onTap: () {
        print('_leftInkWell $type');
        Provider.of<ChildCategory>(context, listen: false).setSelected(index);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(20),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: isClick ? Color.fromRGBO(236, 236, 236, 1) : Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          type,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}

/**
 * 右侧导航
 */
class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    int selected = Provider
        .of<ChildCategory>(context)
        .selected;
    final childCategory = Provider.of<ChildCategory>(context);
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(570),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: childCategory.childCategoryList.length != 0
              ? childCategory.childCategoryList[selected].bxMallSubDto.length
              : 0,
          itemBuilder: (context, index) {
            return _rightInkWell(Provider
                .of<ChildCategory>(context)
                .childCategoryList[selected]
                .bxMallSubDto[index]);
          }),
    );
  }

  Widget _rightInkWell(BxMallSubDto item) {
    return InkWell(
      onTap: () {
        print('_rightInkWell  ${item.mallSubName}');
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.mallSubName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}


//商品列表，可以上拉加载

class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {

  List<CategoryListData> list = [];

  @override
  void initState() {
    _getGoodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('商品列表'),
    );
  }

  void _getGoodList()async {
    var data={
      'categoryId':'4',
      'categorySubId':"",
      'page':1
    };
    await request('getMallGoods',formData:data ).then((val){
      var  data = json.decode(val.toString());
      CategoryGoodsListModel goodsList=  CategoryGoodsListModel.fromJson(data);
      setState(() {
        list= goodsList.data;
      });
      print('>>>>>>>>>>>>>>>>>>>:${list[0].goodsName}');
    });

  }
}
