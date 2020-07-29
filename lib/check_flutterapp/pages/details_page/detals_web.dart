import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutterapp/check_flutterapp/provide/details_Info.dart';
import 'package:provider/provider.dart';

class DetailsWeb extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var goodsDetail = Provider.of<DetailsInfoProvide>(context, listen: false).goodsInfo.data.goodInfo.goodsDetail;
    return Container(
      child: Html(
        data:goodsDetail,
      ),
    );
  }
}










