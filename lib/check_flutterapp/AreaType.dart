




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class AreaType  extends StatefulWidget {
  final  num textSzie;
  final num childTopSpace;

  AreaType({
    num textSzie,
    num childTopSpace
  }): this.textSzie = textSzie,this.childTopSpace = childTopSpace;

  @override
  AreaTypeState createState() => AreaTypeState(textSzie,childTopSpace);
}



class AreaTypeState extends State<AreaType> {
  final  num textSzie;
  final num childTopSpace;

  AreaTypeState(this.textSzie,this.childTopSpace);

  @override
  Widget build(BuildContext context) {
    num textSzie = ScreenUtil().setSp(26);
    return  new Container(
      margin: EdgeInsets.fromLTRB(0, childTopSpace, 0, 0),
      alignment: Alignment.topLeft,
      child: Row(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(minWidth: 0, maxHeight: 70),
            alignment: Alignment.topLeft,
            child: _getText('区域类型 ', textSzie),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Radio(
                    value: 1,
                    onChanged: this._sexChanged,
                    groupValue: this.areaType,
                  ),
                  _getText("普通", textSzie),
                  Radio(
                    value: 2,
                    onChanged: this._sexChanged,
                    groupValue: this.areaType,
                  ),
                  _getText("岔路口", textSzie),
                  Radio(
                    value: 3,
                    onChanged: this._sexChanged,
                    groupValue: this.areaType,
                  ),
                  _getText("出入口", textSzie),
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 4,
                    onChanged: this._sexChanged,
                    groupValue: this.areaType,
                  ),

                  Container(
                    constraints: BoxConstraints(minWidth: 20, maxHeight: 70),
                    child:   _getText("重点区", textSzie),
                  ),

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }


  int areaType = 1;
  void _sexChanged(value) {
    setState(() {
      this.areaType = value;
    });
  }

  Widget _getText(String text, num textSzie) {
    return Text(text,
        style: TextStyle(
            decorationStyle: TextDecorationStyle.solid,
            fontSize: textSzie,
            color: Colors.white));
  }
}

















