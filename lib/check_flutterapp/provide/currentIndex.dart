
import 'package:flutter/cupertino.dart';


class CurrentIndexProvide  with ChangeNotifier{
  int currentIndex=0;

  changeIndex(int newIndex){
    currentIndex = newIndex;
    notifyListeners();
  }


}

