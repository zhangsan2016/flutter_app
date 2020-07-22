import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapp/check_flutterapp/entity/category_big_model.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int selected = 0;

  void getchildCategory( List<BxMallSubDto> list) {

    // 恢复当前类型index
    selected = 0;
    // 通知状态更新
    childCategoryList = list;
    notifyListeners();

  }

  void setSelected( int s ) {
    selected = s;
    notifyListeners();
  }
}
