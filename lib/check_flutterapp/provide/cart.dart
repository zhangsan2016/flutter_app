import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapp/check_flutterapp/entity/cartInfo.dart';
import 'package:flutterapp/check_flutterapp/entity/category_big_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide  with ChangeNotifier {
  // 购物车数据模型
  List<CartInfoModel> cartList=[];
  // 购物车持久化存储值
  String cartInfo = 'cartInfo';
  String cartString = "[]";

  save(goodsId,goodsName, count,price,images)async{

    // 初始化 SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString(cartInfo);

    // 判断 cartString 是否为空，为空说明是第一次添加，或者被key被清除了。
    // 如果有值进行 decode 操作
    var temp = cartString == null ?[] : json.decode(cartString.toString());

    // 把获取值转变成 List
    List<Map> tempList = (temp as List).cast();
    // 声明变量，用于判断购物车中是否已经存在此商品 ID
    var isHave = false; // 默认没有
    int ival = 0; // 用于进行循环，找出是否已经存在商品
    tempList.forEach((item){
      // 如果存在，数量进行+1操作
      if(item['goodsId'] == goodsId){
        tempList[ival]['count'] = item['count']+1;
        cartList[ival].count++;
        isHave = true;
      }
      ival++;
    });

    // 如果没有进行增加
    if(!isHave){
      Map<String, dynamic> newGoods={
        'goodsId':goodsId,
        'goodsName':goodsName,
        'count':count,
        'price':price,
        'images':images
      };

      tempList.add(newGoods);
      cartList.add(new CartInfoModel.fromJson(newGoods));
    }

    // 把字符串进行 encode 操作
    cartString = json.encode(tempList).toString();
    print('cartString = $cartString');
    prefs.setString(cartInfo, cartString); // 进行持久化
    notifyListeners();
  }


  remove() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.clear();//清空键值对
    prefs.remove(cartInfo);
    print('清空完成-----------------');
    notifyListeners();
  }

  /**
   *  获取购物车中的商品
   */
  getCartInfo() async{
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    cartString =  prefs.getString(cartInfo);
    if(cartString == null){
      cartList = [];
    }else{
      cartList = [];
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();
      tempList.forEach((item){
        cartList.add(CartInfoModel.fromJson(item));
      });
    }
    notifyListeners();
  }


}























