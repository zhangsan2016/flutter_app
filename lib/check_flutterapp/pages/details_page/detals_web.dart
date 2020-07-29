import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/check_flutterapp/provide/details_Info.dart';
import 'package:provider/provider.dart';

class DetailsWeb extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var goodsDetail = Provider.of<DetailsInfoProvide>(context, listen: false).goodsInfo.data.goodInfo.goodsDetail;
    var isLeft = Provider.of<DetailsInfoProvide>(context, listen: false).isLeft;

    if(isLeft){
      return Consumer<DetailsInfoProvide>(builder: (context, counter, _) {
        return
          Container(
            child: Html(
              data:goodsDetail,
            ),
          );

      });
    }else{
     return  Container(
        width: ScreenUtil().setWidth(750),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child:Text('暂时没有数据'),
      );
    }




  }
}










