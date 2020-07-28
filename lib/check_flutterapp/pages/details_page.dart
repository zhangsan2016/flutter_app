import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/check_flutterapp/provide/detailsInfo_provide.dart';
import 'package:provider/provider.dart';

import 'details_explain.dart';
import 'details_top_area.dart';

/**
 * 商品详情页的首屏区域，包括图片、商品名称，商品价格，商品编号的UI展示
 */
class DetailsPage extends StatelessWidget {
  final String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {

    return Consumer<DetailsInfoProvide>(
        builder: (context, counter, _) {
          return Scaffold(appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text("商品详情页面"),
          ),
              body: FutureBuilder(
                future:_getBackInfo(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: Column(children: <Widget>[
                        // 商品图片
                        DetailsTopArea(),
                        // 商品说明
                        DetailsExplain(),
                      ],),
                    );
                }else{
                    return Text('商品详情页面',style: TextStyle(color: Colors.pink),);
                  }
                },
              ));
        });
  }

  Future _getBackInfo(BuildContext context)async{
    await Provider.of<DetailsInfoProvide>(context, listen: false).getGoodsInfo(goodsId);
    return"加载完成.....";
  }
}




























