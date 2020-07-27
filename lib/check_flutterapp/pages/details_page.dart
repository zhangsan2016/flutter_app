import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/check_flutterapp/provide/detailsInfo_provide.dart';
import 'package:provider/provider.dart';

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
                          Text('商品id $goodsId'),
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




























