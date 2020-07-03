import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapp/check_flutterapp/entity/category_big_model.dart';

class ChildCategory with   ChangeNotifier {
  List<CategoryModel> childCategoryList = [];
  int selected = 0;

  void getchildCategory( List<CategoryModel> list) {

    childCategoryList = list;
    notifyListeners();

  }

  void setSelected( int s ) {
    selected = s;
    notifyListeners();
  }
}
