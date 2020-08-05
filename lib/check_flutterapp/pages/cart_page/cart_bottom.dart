import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          _selectAllBtn(),
          _allPriceArea(),
          _goButton(),
        ],
      ),
    );
  }

  /**
   * 全选按钮
   */
  Widget _selectAllBtn() {
    return Container(
        child: Row(
      children: <Widget>[
        Checkbox(
          value: true,
          activeColor: Colors.pink,
          onChanged: (bool val) {},
        ),
        Text('全选'),
      ],
    ));
  }

  Widget _allPriceArea() {
    return Container(
      width: ScreenUtil().setWidth(410),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(260),
                child: Text(
                  '合计:',
                  style: TextStyle(
                      color: Colors.black, fontSize: ScreenUtil().setSp(36)),
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(150),
                alignment: Alignment.centerLeft,
                child: Text(
                  '￥1992.0',
                  style: TextStyle(
                      color: Colors.red, fontSize: ScreenUtil().setSp(36)),
                ),
              ),
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(410),
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费，预购免配送费',
              style: TextStyle(
                  color: Colors.black38, fontSize: ScreenUtil().setSp(22)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _goButton() {
    return Container(
      width: ScreenUtil().setWidth(180),
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10.0),
          child: Text(
            '结算(6)',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(3.0)),
        ),
      ),
    );
  }

  //结算按钮
  Widget goButton() {
    return Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(3.0)),
          child: Text(
            '结算(6)',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
