


import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('CartPage');
    // getHttp();
    return Scaffold(
      body: Center(child: Text('购物车界面'),),
    );
  }

  void getHttp() async{
    try{
      Response response;
      response = await Dio().get('http://121.40.194.91:8080/ldsight/deviceAction');
      print("xxx Response =" + response.toString());
    }catch(e){

    }
  }
}
