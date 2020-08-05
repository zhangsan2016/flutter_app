

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

/**
 * 购物车数量加减按钮UI
 */
class CartCount extends StatelessWidget {
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
          _addBtn(),
          _countArea(),
          _reduceBtn(),
        ],
      ),
    );
  }


  //添加按钮
  Widget _addBtn(){
    return InkWell(
      onTap: (){},
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

  Widget _reduceBtn(){
    return InkWell(
      onTap: (){},
      child:  Container(
        width: ScreenUtil().setWidth(45),
        height: ScreenUtil().setHeight(45),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left:BorderSide(width: 1,color:Colors.black12)),
        ),
        child: Text('+'),
      ),
    );
  }


 Widget _countArea(){
    return Container(
      width: ScreenUtil().setWidth(70),
      height: ScreenUtil().setHeight(45),
      alignment: Alignment.center,
      child: Text('1'),
    );
 }











}
