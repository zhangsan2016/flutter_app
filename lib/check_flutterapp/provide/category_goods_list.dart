import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapp/check_flutterapp/entity/category_big_model.dart';
import 'package:flutterapp/check_flutterapp/entity/category_goods_list_model.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryListData> goodsList = [];
  int selected = 0;

  void getGoodsList( List<CategoryListData> list) {

    // 通知状态更新
    goodsList = list;
    notifyListeners();

  }

  void setSelected(int s ) {
    selected = s;
    notifyListeners();
  }
}
