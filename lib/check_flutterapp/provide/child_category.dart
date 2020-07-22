import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapp/check_flutterapp/entity/category_big_model.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int selected = 0; // 子类高亮索引 childIndex
  String categoryId = '4'; // 大类ID
  String subId ='';  // 小类ID

  void getchildCategory( List<BxMallSubDto> list,String id) {

    // 恢复当前类型index
    selected = 0;
    categoryId=id;
    subId=''; //点击大类时，把子类ID清空
    // 通知状态更新
    childCategoryList = list;
    notifyListeners();

   /* categoryId=id;
    childIndex=0;
    subId=''; //点击大类时，把子类ID清空
    BxMallSubDto all=  BxMallSubDto();
    all.mallSubId='00';
    all.mallCategoryId='00';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCategoryList=[all];
    childCategoryList.addAll(list);
    notifyListeners();*/

  }

  /**
   *  改变子类索引
   *  selected  子类高亮索引
   *  id 小类ID
   */
  void setSelected( int childIndex ,String id) {
    //传递两个参数，使用新传递的参数给状态赋值
    selected = childIndex;
    subId=id;
    notifyListeners();
  }
}
