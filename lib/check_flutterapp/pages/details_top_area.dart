import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterapp/check_flutterapp/provide/category_goods_list.dart';
import 'package:flutterapp/check_flutterapp/provide/detailsInfo_provide.dart';
import 'package:provider/provider.dart';

class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryGoodsListProvide>(builder: (context, counter, _) {
      var goodsInfo = Provider
          .of<DetailsInfoProvide>(context, listen: false)
          .goodsInfo
          .data
          .goodInfo;

      if (goodsInfo != null) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              _goodsImage(goodsInfo.image1),
              _goodsName(goodsInfo.goodsName),
              _goodsNum(goodsInfo.goodsSerialNumber),
              _goodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice)
            ],
          ),
        );
      } else {
        return Text('正在加载中......');
      }
    }
    );
  }

  //商品价格方法
  Widget _goodsPrice(presentPrice,oriPrice){
    return  Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left:15.0),
      margin: EdgeInsets.only(top:8.0),
      child: Row(
        children: <Widget>[
          Text(
            '￥${presentPrice}',
            style: TextStyle(
              color:Colors.pinkAccent,
              fontSize: ScreenUtil().setSp(40),
            ),
          ),
          Text(
            '市场价:￥${oriPrice}',
            style: TextStyle(
                color: Colors.black26,
                decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
    );
  }


  //商品图片
  Widget _goodsImage(url) {
    return Image.network(
        url,
        width: ScreenUtil().setWidth(740)
    );
  }

  //商品名称
  Widget _goodsName(name) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        maxLines: 1,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(30)
        ),
      ),
    );
  }

  Widget _goodsNum(num) {
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15.0),
      margin: EdgeInsets.only(top: 8.0),
      child: Text(
        '编号:${num}',
        style: TextStyle(
            color: Colors.black26
        ),
      ),

    );
  }

}
