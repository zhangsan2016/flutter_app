import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapp/check_flutterapp/entity/category_big_model.dart';
import 'package:flutterapp/check_flutterapp/entity/category_goods_list_model.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  List<CategoryListData> goodsList = [];

  void getGoodsList( List<CategoryListData> list) {

    // 通知状态更新
    goodsList = list;
    notifyListeners();

  }

  void addGoodsList ( List<CategoryListData> list) {
    goodsList.addAll(list);
    notifyListeners();
  }

}
