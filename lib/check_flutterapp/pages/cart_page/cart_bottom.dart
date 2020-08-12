import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/check_flutterapp/provide/cart.dart';
import 'package:provider/provider.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      child: Consumer<CartProvide>(builder: (context, counter, _) {
        return Row(
          children: <Widget>[
            _selectAllBtn(context),
            _allPriceArea(context),
            _goButton(context),
          ],
        );
      }),
    );
  }

  /**
   * 全选按钮
   */
  Widget _selectAllBtn(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Checkbox(
          value: Provider.of<CartProvide>(context, listen: false).isAllCheck,
          activeColor: Colors.pink,
          onChanged: (bool val) {
            Provider.of<CartProvide>(context, listen: false)
                .changeAllCheckBtnState(val);
          },
        ),
        Text('全选'),
      ],
    ));
  }

  Widget _allPriceArea(BuildContext context) {
    double allPrice = Provider.of<CartProvide>(context, listen: false).allPrice;
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
                  '￥${allPrice.toStringAsFixed(2)}',
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

  Widget _goButton(BuildContext context) {
    int allGoodsCount =
        Provider.of<CartProvide>(context, listen: false).allGoodsCount;
    return Container(
      width: ScreenUtil().setWidth(180),
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10.0),
          child: Text(
            '结算($allGoodsCount)',
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
