import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterapp/check_flutterapp/provide/details_Info.dart';
import 'package:provider/provider.dart';

class DetailsTabBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   return Consumer<DetailsInfoProvide>(
        builder: (context, counter, _) {
          var isLeft = Provider.of<DetailsInfoProvide>(context, listen: false).isLeft;
          var isRight = Provider.of<DetailsInfoProvide>(context, listen: false).isRight;

          return Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Column(
             children: <Widget>[
               Row(
                 children: <Widget>[
                     _myTabBarLeft(context, isLeft),
                     _myTabBarRight(context, isRight),
                 ],
               ),
             ],
            )
            ,
          );
        });
  }

  Widget _myTabBarLeft(BuildContext context, bool isLeft) {
    return  InkWell(
      onTap: () {
        Provider.of<DetailsInfoProvide>(context, listen: false).changeLeftAndRight('left');
      },
      child:  Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: isLeft ? Colors.pink : Colors.black12
                )
            )
        ),
        child: Text(
          '详细', style: TextStyle(color: isLeft ? Colors.pink : Colors.black),),
      ),
    );
  }

  Widget _myTabBarRight(BuildContext context, bool isRight) {
    return InkWell(
      onTap: () {
        Provider.of<DetailsInfoProvide>(context, listen: false).changeLeftAndRight('right');
      },
      child: Container(

        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: isRight ? Colors.pink : Colors.black12
                )
            )
        ),
        child: Text(
          '评论',
          style: TextStyle(
              color: isRight ? Colors.pink : Colors.black
          ),
        ),
      ),
    );
  }


}



























