import 'package:flutter/cupertino.dart';
import 'package:flutterapp/check_flutterapp/entity/category_big_model.dart';

class ChildCategory with  ChangeNotifier {
  List<CategoryModel> childCategoryList = [];

  void getchildCategory( List<CategoryModel> list) {
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxx getchildCategory ${list.length}');
    childCategoryList = list;
    notifyListeners();
  }
}
