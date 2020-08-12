import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterapp/check_flutterapp/entity/cartInfo.dart';
import 'package:flutterapp/check_flutterapp/entity/category_big_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide with ChangeNotifier {
  // 购物车数据模型
  List<CartInfoModel> cartList = [];

  // 购物车持久化存储值
  String cartInfo = 'cartInfo';
  String cartString = "[]";

  //总价格
  double allPrice = 0;
  //商品总数量
  int allGoodsCount = 0;
  // 是否全选
  bool isAllCheck = false;

  save(goodsId, goodsName, count, price, images) async {
    // 初始化 SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString(cartInfo);

    // 判断 cartString 是否为空，为空说明是第一次添加，或者被key被清除了。
    // 如果有值进行 decode 操作
    var temp = cartString == null ? [] : json.decode(cartString.toString());

    // 把获取值转变成 List
    List<Map> tempList = (temp as List).cast();
    // 声明变量，用于判断购物车中是否已经存在此商品 ID
    var isHave = false; // 默认没有
    int ival = 0; // 用于进行循环，找出是否已经存在商品

    //把商品总数量设置为0
    allPrice=0;
    allGoodsCount=0;
    tempList.forEach((item) {
      // 如果存在，数量进行+1操作
      if (item['goodsId'] == goodsId) {
        tempList[ival]['count'] = item['count'] + 1;
        cartList[ival].count++;
        isHave = true;
      }
      if(item['isCheck']){
        allPrice+= (cartList[ival].price* cartList[ival].count);
        allGoodsCount+= cartList[ival].count;
      }
      ival++;
    });

    // 如果没有进行增加
    if (!isHave) {
      Map<String, dynamic> newGoods = {
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': images,
        'isCheck': true
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

  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.clear();//清空键值对
    prefs.remove(cartInfo);
    print('清空完成-----------------');
    notifyListeners();
  }

  /**
   *  获取购物车中的商品
   */
  getCartInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString(cartInfo);

    if (cartString == null) {
      cartList = [];
    } else {
      cartList = [];
      List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

      allPrice = 0; //总价格
      allGoodsCount = 0; //商品总数量
      isAllCheck = true;

      // 如果没有商品，全选状态修改为false
      if(tempList.length == 0){
        isAllCheck = false;
      }

      tempList.forEach((item) {
        if (item['isCheck']) {
          allPrice += (item['price'] * item['count']);
          allGoodsCount += item['count'];
        } else {
          isAllCheck = false;
        }
        cartList.add(CartInfoModel.fromJson(item));
      });
    }
    notifyListeners();
  }

  /**
   * 删除单个购物车商品
   */
  deleteOneGoods(String goodsId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString(cartInfo);
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    int tempIndex = 0;
    int delIndex = 0;
    tempList.forEach((item) {
      if (item['goodsId'] == goodsId) {
        delIndex = tempIndex;
      }
      tempIndex++;
    });

    tempList.removeAt(delIndex);
    cartString = json.encode(tempList).toString();
    prefs.setString(cartInfo, cartString);
    await getCartInfo();
  }

  /**
   * 更改单个商品选中状态
   */
  changeCheckState(CartInfoModel cartItem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString(cartInfo); // 得到持久化的字符串
    var c = json.decode(cartString.toString());
    List<Map> tempList = (json.decode(cartString.toString()) as List)
        .cast(); // 声明临时List，用于循环找到修改项的索引。
    int tempIndex = 0; // 循环使用索引
    int changeIndex = 0; // 需要修改的索引
    tempList.forEach((item) {
      if (item['goodsId'] == cartItem.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });
    tempList[changeIndex] = cartItem.toJson(); // 把对象变成 Map 值
    cartString = json.encode(tempList).toString(); // 编程字符串
    prefs.setString(cartInfo, cartString); // 进行持久化
    await getCartInfo(); // 重新读取列表
  }

  /**
   * 更改全部商品选中状态
   */
  changeAllCheckBtnState(bool isCheck) async {
    /*SharedPreferences prefs = await SharedPreferences.getInstance();
    String cart = prefs.getString(cartInfo);
    List<Map> tempList = (json.decode(cart.toString()) as List).cast();

    tempList.forEach((item) {
      item['isCheck'] = isCheck;
    });

    isAllCheck = isCheck;

    cartString = json.encode(tempList).toString();
    prefs.setString(cartInfo, cartString);
    await getCartInfo();*/

    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.get(cartInfo);
    List<Map> templist = (json.decode(cartString.toString()) as List).cast();

    List<Map> newList = []; // 新建一个 List，用于组成新的持久化数据
    for (var item in templist) {
      var newItem = item; // 复制新的变量，因为 Dart 不让循环时修改原值
      newItem['isCheck'] = isCheck; // 改变选中状态
      newList.add(newItem);
    }
    cartString = json.encode(newList).toString(); // 形成字符串
    prefs.setString(cartInfo, cartString); // 进行持久化
    await getCartInfo();
  }

  addOrReduceAction(var cartItem, String todo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString(cartInfo);
    List<Map> tempList = (json.decode(cartString.toString()) as List).cast();

    int tempIndex = 0; // 循环使用索引
    int changeIndex = 0; // 需要修改的索引

    tempList.forEach((item) {
      if (item['goodsId'] == cartItem.goodsId) {
        changeIndex = tempIndex;
      }
      tempIndex++;
    });

    if (todo == 'add') {
      cartItem.count++;
    } else {
      if (cartItem.count > 1) {
        cartItem.count--;
      }
    }

    tempList[changeIndex] = cartItem.toJson();
    cartString = json.encode(tempList).toString();
    prefs.setString(cartInfo, cartString);
    await getCartInfo();

  }
}
