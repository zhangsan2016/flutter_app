import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/check_flutterapp/entity/category_big_model.dart';
import 'package:flutterapp/check_flutterapp/entity/category_goods_list_model.dart';
import 'package:flutterapp/check_flutterapp/provide/child_category.dart';
import 'package:flutterapp/check_flutterapp/service/service_method.dart';
import 'package:oktoast/oktoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    // 申请权限
    _requestPermission();
  }

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

  /**
   *  申请权限
   */
  Future _requestPermission() async {
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    // 申请结果
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission == PermissionStatus.granted) {
      showToast('权限申请通过', position: ToastPosition.bottom);
    } else {
      showToast('权限申请被拒绝', position: ToastPosition.bottom);
    }
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
    // 判断是否当前显示的状态
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
    int selected = Provider.of<ChildCategory>(context).selected;
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
            return _rightInkWell(Provider.of<ChildCategory>(context)
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
  List<CategoryListData> categoryListData = [];

  @override
  void initState() {
    _getGoodList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: ScreenUtil().setWidth(570),
        height: ScreenUtil().setHeight(800),
        child: ListView.builder(
            itemCount: categoryListData.length,
            itemBuilder: (context, index) {
              return _goodsList(index);
            }),
      ),
    );
  }

  void _getGoodList() async {
    /*  var data = {'categoryId': '4', 'categorySubId': "", 'page': 1};
    await request('getMallGoods', formData: data).then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);

      // 生成数据测试用
      List<CategoryListData> productionData = [];
      for (int i = 0; i < 20; i++) {
        CategoryListData cld = new CategoryListData();
        cld.image = 'images/checkp.png';
        cld.goodsName = 'goods${55 + i}';
        cld.presentPrice = (998.62 + Random().nextInt(10));
        cld.oriPrice = (662.62 + Random().nextInt(3));
        productionData.add(cld);
      }

      print('xxxxxxxxxxxxxxxxxx ${productionData.length}');

      setState(() {
        // categoryListData = goodsList.data;
        categoryListData = productionData;
      });
    //  print('>>>>>>>>>>>>>>>>>>>:${list[0].goodsName}');
    });*/

    // 生成数据测试用
    List<CategoryListData> productionData = [];
    int num =10 + Random().nextInt(30);
    for (int i = 0; i < num; i++) {
      CategoryListData cld = new CategoryListData();
      cld.image = 'images/checkp.png';
      cld.goodsName = '商品名称信息${55 + i}';
      cld.presentPrice = (998.62 + Random().nextInt(10));
      cld.oriPrice = (662.62 + Random().nextInt(3));
      productionData.add(cld);
    }

    setState(() {
      // categoryListData = goodsList.data;
      categoryListData = productionData;
    });
  }

  Widget goodsImage(index) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.asset(
        'images/checkp.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget goodsPirce(index) {
    return Container(
      width: ScreenUtil().setWidth(320),
       margin: EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Text(
            '￥${categoryListData[index].presentPrice}',
            style:
                TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
          ),
          Text('￥${categoryListData[index].oriPrice}',
            style: TextStyle(
                color: Colors.black26, decoration: TextDecoration.lineThrough,fontSize: ScreenUtil().setSp(22)),
          ),
        ],
      ),
    );
  }

  Widget _goodsList(index) {
    return Container(
      decoration: BoxDecoration (
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      margin: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          goodsImage(index),
          Column(
            children: <Widget>[
              goodsName(index),
              goodsPirce(index),
            ],
          ),
        ],
      ),
    );
  }

  Widget goodsName(index) {
    return Container(
     // color: Colors.pink,
      padding:EdgeInsets.all(5.0) ,
      margin: EdgeInsets.only(top: 5.0),
      width: ScreenUtil().setWidth(340),
      child: Text('${categoryListData[index].goodsName}',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle( fontSize: ScreenUtil().setSp(28),),
      ),
    );
  }
}
