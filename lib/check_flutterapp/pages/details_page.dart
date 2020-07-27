
import 'package:flutter/cupertino.dart';
import 'package:flutterapp/check_flutterapp/provide/detailsInfo_provide.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {

    Provider.of<DetailsInfoProvide>(context, listen: false).getGoodsInfo("childList, categoryId");

    return Consumer<DetailsInfoProvide>(
          builder: (context, counter, _) {
            return     Container(
                child:Text('商品ID为：${goodsId}')

            );
          });

  }
}