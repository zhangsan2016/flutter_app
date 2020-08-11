

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterapp/check_flutterapp/provide/cart.dart';
import 'package:provider/provider.dart';

/**
 * 购物车数量加减按钮UI
 */
class CartCount extends StatelessWidget {
  var item;
  CartCount(this.item);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(165),
      margin: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
       // color: Colors.red,
        border: Border.all(width: 1,color: Colors.black12),
      ),
      child: Row(
        children: <Widget>[
          _reduceBtn(context),
          _countArea(),
          _addBtn(context),

        ],
      ),
    );
  }


  //添加按钮
  Widget _addBtn( context){
    return InkWell(
      onTap: (){
        Provider.of<CartProvide>(context, listen: false).addOrReduceAction(item, 'add');
      },
      child: Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            border:Border(right:BorderSide(width:1,color:Colors.black12)
            )
        ),
        child: Text('+'),
      ),
    );
  }

  Widget _reduceBtn(context){
    return InkWell(
      onTap: (){
        Provider.of<CartProvide>(context, listen: false).addOrReduceAction(item, 'reduce');
      },
      child:  Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left:BorderSide(width: 1,color:Colors.black12)),
        ),
        child: Text('-'),
      ),
    );
  }


 Widget _countArea(){
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      child: Text('${item.count}'),
    );
 }











}
