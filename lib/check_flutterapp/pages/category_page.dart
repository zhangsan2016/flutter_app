import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/check_flutterapp/entity/category_big_model.dart';
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
        body: Provider(
          create: (_) => new ChildCategory(),
          child: Container(
            child: Row(
              children: <Widget>[

                // 左侧导航
               LeftCatgegoryNav(),
                // 右侧导航
            Column(
              children: <Widget>[
                RightCategoryNav(),
              ],
            ),
              ],
            ),
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
    print('initState xxxxxxxxxxxxxxxxxxxxxxx');
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build xxxxxxxxxxxxxxxxxxxxxxx');
   // print('Provider.of<ChildCategory>(context) xxxxxxxxxxxxxxx ${Provider.of<ChildCategory>(context).childCategoryList?.length}');
  //  print('Provider.of<ChildCategory>(context) xxxxxxxxxxxxxxx ${Provider.of<ChildCategory>(context).childCategoryList[0].mallCategoryId}');
    return  Container(
          width: ScreenUtil().setWidth(180),
          decoration: BoxDecoration(border: Border(right: BorderSide(width: 1, color: Colors.black12))),
          child:
        //  Container(),

          Consumer<ChildCategory>(
              builder: (context, counter, _) {
                return ListView.builder(
                    itemCount: Provider.of<ChildCategory>(context).childCategoryList?.length,
                    itemBuilder: (context, index) {
                      return _leftInkWell(Provider.of<ChildCategory>(context).childCategoryList[index].mallCategoryId, context);
                    });
              }
          ),
    );
  }

  void _getCategory()  {
    request('getCategory').then((val) {
      var data = json.decode(val.toString());
      // CategoryBigModel category = CategoryBigModel.fromJson(data);

      // list = category.data;
      List<CategoryModel> categoryModels = List<CategoryModel>();
      for (int i = 0; i < 15; i++) {
        CategoryModel categoryModel = CategoryModel(mallCategoryId: '类型$i');
        categoryModel.bxMallSubDto = new List<BxMallSubDto>();
        for (int b = 0; b < 8; b++) {
          BxMallSubDto bxMallSubDto = new BxMallSubDto();
          bxMallSubDto.mallSubName = '${categoryModel.mallCategoryId} $b';
          categoryModel.bxMallSubDto.add(bxMallSubDto);
        }

        categoryModels.add(categoryModel);
      }
      setState(() {

        list = categoryModels;
        Provider.of<ChildCategory>(context, listen: false) .getchildCategory(list);

      });
    });
  }

  /**
   * 根据 index 获取 json中的单个类别
   */
  Widget _leftInkWell(String type, BuildContext context) {
    return InkWell(
      onTap: () {
        // Provider.of<ChildCategory>(context).getchildCategory(list);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(20),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: Colors.white,
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
          itemCount:
              Provider.of<ChildCategory>(context).childCategoryList.length,
          itemBuilder: (context, index) {
            return _rightInkWell(Provider.of<ChildCategory>(context)
                .childCategoryList[index]
                .bxMallSubDto[index]);
          }),
    );
  }

  Widget _rightInkWell(BxMallSubDto item) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          // item.mallSubName,
          '66',
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}
