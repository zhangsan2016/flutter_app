import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/check_flutterapp/entity/category_big_model.dart';
import 'package:flutterapp/check_flutterapp/entity/category_goods_list_model.dart';
import 'package:flutterapp/check_flutterapp/provide/category_goods_list.dart';
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
            Expanded(
              child: Column(
                children: <Widget>[
                  RightCategoryNav(),
                  CategoryGoodsList(),
                ],
              ),
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

    // 在InitState（）中使用 Provider.of<T>(context)是错误的。
    // 我们通过 addPostFrameCallback 回调中在第一帧 build 结束时调用 increment 方法，这样就不会出现构建错误了。
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      _getCategory();
      // 获取商品列表
      _getGoodList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black12))),
      child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return _leftInkWell(list[index].mallCategoryId, context, index);
          }),
    );
  }

  /**
   * 根据 index 获取 json中的单个类别
   */
  int listIndex = 0;

  Widget _leftInkWell(String type, BuildContext context, int index) {
    // 判断是否当前显示的状态
    bool isClick = listIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          listIndex = index;
        });

        var childList = list[index].bxMallSubDto;
        var categoryId = list[index].mallCategoryId;

        // Provider.of<ChildCategory>(context, listen: false).getchildCategory(list);
        Provider.of<ChildCategory>(context, listen: false)
            .getchildCategory(childList, categoryId);
        _getGoodList(categoryId: categoryId);
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
            .getchildCategory(list[0].bxMallSubDto, list[0].mallCategoryId);
      });
    });

    // list = category.data;
  }

  /**
   *  根据类型id获取商品列表
   */
  int countNum = 0;
  void _getGoodList({String categoryId}) async {
    /*  var data = {'categoryId': '4', 'categorySubId': "", 'page': 1};
    await request('getMallGoods', formData: data).then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);

      // 网络获取数据中做非空判断，以免程序崩溃
       if(goodsList.data==null){
         Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
        }else{
          Provide.value<CategoryGoodsListProvide>(context).getGoodsList(goodsList.data);

        }

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
    String image =
        countNum % 2 == 0 ? 'images/checkp.png' : 'images/checkp2.png';
    int num = 10 + Random().nextInt(30);
    for (int i = 0; i < num; i++) {
      CategoryListData cld = new CategoryListData();
      cld.image = image;
      cld.goodsName = '商品名称信息${55 + i}';
      cld.presentPrice = (998.62 + Random().nextInt(10) * countNum);
      cld.oriPrice = (662.62 + Random().nextInt(3));
      productionData.add(cld);
    }
    countNum++;

    Provider.of<CategoryGoodsListProvide>(context, listen: false)
        .getGoodsList(productionData);
  }
}

/**
 * 小类右侧导航
 */
class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    final childCategoryList =
        Provider.of<ChildCategory>(context).childCategoryList;
    if (childCategoryList.length == 0) {
      return Container();
    }
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
          itemCount: childCategoryList.length,
          itemBuilder: (context, index) {
            return _rightInkWell(index,
                Provider.of<ChildCategory>(context).childCategoryList[index]);
          }),
    );
  }

  Widget _rightInkWell(int index, BxMallSubDto item) {
    int selected = Provider.of<ChildCategory>(context).selected;
    bool isClick = selected == index;
    return InkWell(
      onTap: () {
        Provider.of<ChildCategory>(context, listen: false)
            .setSelected(index, item.mallSubId);
        print('_rightInkWell  ${item.mallSubName}');
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item.mallSubName,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
              color: isClick ? Colors.pink : Colors.black),
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
  GlobalKey<RefreshFooterState> _footerkey = new GlobalKey<RefreshFooterState>();
  var scrollController=new ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<CategoryGoodsListProvide>(builder: (context, counter, _) {
        try{
          if(Provider.of<ChildCategory>(context, listen: false).page==1){
            scrollController.jumpTo(0.0);
          }
        }catch(e){
          print('进入页面第一次初始化：${e}');
        }
        if (counter.goodsList.length > 0) {
          return Container(
            width: ScreenUtil().setWidth(570),
            //  height: ScreenUtil().setHeight(800),
            child: EasyRefresh(
              refreshFooter: ClassicsFooter(
                  key: _footerkey,
                  bgColor: Colors.white,
                  textColor: Colors.pink,
                  moreInfoColor: Colors.pink,
                  showMore: true,
                  noMoreText: Provider.of<ChildCategory>(context).noMoreText,
                  moreInfo: '加载中',
                  loadReadyText: '上拉加载'),
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: counter.goodsList.length,
                  itemBuilder: (context, index) {
                    return _goodsList(counter.goodsList[index]);
                  }),
              onRefresh: () async {
                print('onRefresh');
              },
              loadMore: () async {
              //  print('没有更多了.......');
                await new Future.delayed(const Duration(seconds: 2), () {
                  _getMoreList();
                });

              },
            ),
          );
        } else {
          return Text('暂时没有数据');
        }
      }),
    );
  }


  /**
   *  获取更多商品
   */
  void _getMoreList() async {
    /*Provide.value<ChildCategory>(context).addPage();
    var data={
      'categoryId':Provide.value<ChildCategory>(context).categoryId,
      'categorySubId':Provide.value<ChildCategory>(context).subId,
      'page':Provide.value<ChildCategory>(context).page
    };

    request('getMallGoods',formData:data ).then((val){
      var  data = json.decode(val.toString());
      CategoryGoodsListModel goodsList=  CategoryGoodsListModel.fromJson(data);

      if(goodsList.data==null){
        Provide.value<ChildCategory>(context).changeNoMore('没有更多了');
      }else{

        Provide.value<CategoryGoodsListProvide>(context).addGoodsList(goodsList.data);

      }
    });*/

    // 生成数据测试用
    int page = Provider.of<ChildCategory>(context, listen: false).page;
    print('page = $page');
    if(page == 3){
      Provider.of<ChildCategory>(context,listen: false).changeNoMore('没有更多了');
      return;
    }

    Provider.of<ChildCategory>(context, listen: false).addPage();
    List<CategoryListData> productionData = [];
    int num = 10 + Random().nextInt(30);
    for (int i = 0; i < 5; i++) {

      CategoryListData cld = new CategoryListData();
      cld.image = 'images/checkp.png';
      cld.goodsName = '商品名称信息${55 + i}';
      cld.presentPrice = (998.62 + Random().nextInt(10) );
      cld.oriPrice = (662.62 + Random().nextInt(3));
      productionData.add(cld);
    }
    if(productionData==null){
      Provider.of<ChildCategory>(context,listen: false).changeNoMore('没有更多了');
    }else{
      Provider.of<CategoryGoodsListProvide>(context,listen: false).addGoodsList(productionData);
    }
  }

  Widget goodsImage(CategoryListData categoryListData) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Image.asset(
        categoryListData.image,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget goodsPirce(categoryListData) {
    return Container(
      width: ScreenUtil().setWidth(320),
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        children: <Widget>[
          Text(
            '￥${categoryListData.presentPrice}',
            style:
                TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(30)),
          ),
          Text(
            '￥${categoryListData.oriPrice}',
            style: TextStyle(
                color: Colors.black26,
                decoration: TextDecoration.lineThrough,
                fontSize: ScreenUtil().setSp(22)),
          ),
        ],
      ),
    );
  }

  Widget _goodsList(CategoryListData categoryListData) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      margin: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          goodsImage(categoryListData),
          Column(
            children: <Widget>[
              goodsName(categoryListData),
              goodsPirce(categoryListData),
            ],
          ),
        ],
      ),
    );
  }

  Widget goodsName(CategoryListData categoryListData) {
    return Container(
      // color: Colors.pink,
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.only(top: 5.0),
      width: ScreenUtil().setWidth(340),
      child: Text(
        '${categoryListData.goodsName}',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(28),
        ),
      ),
    );
  }
}
