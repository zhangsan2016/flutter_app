import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_seekbar/seekbar/seekbar.dart';

import 'cc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Container(
      child: MaterialApp(
        title: '百姓生活++',
        // 去掉运行时 debug 的提示
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.pink),
        home: Scaffold(
          appBar: AppBar(title: const Text('AMaps examples')),
          //    backgroundColor: Colors.black,
          body: MyHomePage(),
        ),
      ),
    );
  }
}

final uuidController = TextEditingController(); //输入监听
final projectController = TextEditingController(); //输入监听

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return _controlView();
  }

  /**
   * 单灯控制界面
   */

  Widget _controlView() {
    num textSzie = ScreenUtil().setSp(26);
    num childTopSpace = ScreenUtil().setHeight(45);
    String radioalue = '普通';
    return new Container(
      width: ScreenUtil().setWidth(double.infinity),
      height: ScreenUtil().setWidth(double.infinity),
      padding: EdgeInsets.all(20),
      decoration: new BoxDecoration(
        color: Color.fromARGB(240, 11, 29, 77),
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, childTopSpace, 0, 0),
            child: Row(
              children: <Widget>[
                _getText('预警状态     ', textSzie),
                _getText('离线', textSzie),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, childTopSpace, 0, 0),
            child: Row(
              children: <Widget>[
                _getText('整体开关     ', textSzie),
                new Container(
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(100),
                  child: RaisedButton(
                    child: Text('开'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (uuidController.text.length > 0) {
                        print('开${uuidController.text}');
                      } else {
                        print('开失败');
                      }
                    },
                  ),
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(100),
                  child: RaisedButton(
                    child: Text('关'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (uuidController.text.length > 0) {
                        print('关${uuidController.text}');
                      } else {
                        print('关失败');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(0, childTopSpace, 0, 0),
            child: Row(
              children: <Widget>[
                _getText('快速调灯       ', textSzie),
                Container(
                    width: 200,
                    child: SeekBar(
                        afterDragShowSectionText: true,
                        bubbleRadius: 14,
                        value: 0,
                        min: 0,
                        max: 100,
                        hideBubble: false,
                        onValueChanged: (v) {
                          print('当前进度：${v.progress} ，当前的取值：${v.value.ceil()}');
                        })),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(0, childTopSpace, 0, 0),
            child: Row(
              children: <Widget>[
                _getText('        主灯       ', textSzie),
                Container(
                    width: 200,
                    child: SeekBar(
                        afterDragShowSectionText: true,
                        bubbleRadius: 14,
                        value: 0,
                        min: 0,
                        max: 100,
                        hideBubble: false,
                        onValueChanged: (v) {
                          print('当前进度：${v.progress} ，当前的取值：${v.value.ceil()}');
                        })),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(0, childTopSpace, 0, 0),
            child: Row(
              children: <Widget>[
                _getText('        辅灯       ', textSzie),
                Container(
                    width: 200,
                    child: SeekBar(
                        afterDragShowSectionText: true,
                        bubbleRadius: 14,
                        value: 0,
                        min: 0,
                        max: 100,
                        hideBubble: false,
                        onValueChanged: (v) {
                          print('当前进度：${v.progress} ，当前的取值：${v.value.ceil()}');
                        })),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(0, childTopSpace, 0, 0),
            alignment: Alignment.topLeft,
            child: Row(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(minWidth: 0,maxHeight:70),
                  alignment: Alignment.topLeft,
                  color: Colors.indigoAccent,
                  child: _getText('区域类型 ', textSzie),),

                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          onChanged: this._sexChanged,
                          groupValue: this.areaType,
                        ),
                        _getText("普通",textSzie),
                        Radio(
                          value: 2,
                          onChanged: this._sexChanged,
                          groupValue: this.areaType,
                        ),
                        _getText("岔路口",textSzie),
                        Radio(
                          value: 3,
                          onChanged: this._sexChanged,
                          groupValue: this.areaType,
                        ),
                        _getText("出入口",textSzie),
                      ],
                    ),
                    Row(
                      children: <Widget>[

                        Radio(
                          value: 4,
                          onChanged: this._sexChanged,
                          groupValue: this.areaType,
                        ),
                        _getText("重点区",textSzie),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
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

  /**
   *  搜索
   */
  Widget search() {
    return new Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(15.0, 0, 5.0, 0),
          height: ScreenUtil().setHeight(90),
          width: ScreenUtil().setWidth(200),
          //  color: Colors.blue.shade100,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: TextField(
              controller: uuidController,
              decoration: InputDecoration(
                  hintText: "UUID",
                  contentPadding: EdgeInsets.fromLTRB(10.0, 0, 0, 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.orangeAccent, //边框颜色为绿色
                    width: 1, //宽度为5
                  ))),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
          height: ScreenUtil().setHeight(90),
          width: ScreenUtil().setWidth(200),
          //  color: Colors.blue.shade100,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: TextField(
              controller: projectController,
              decoration: InputDecoration(
                hintText: "项目名称",
                contentPadding: EdgeInsets.fromLTRB(10.0, 0, 0, 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.orangeAccent, //边框颜色为绿色
                  width: 1, //宽度为5
                )),

                // labelStyle: TextStyle(color: Colors.blue, fontSize: 24.0),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(200),
          child: RaisedButton(
            child: Text('搜索'),
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () {
              print('提交');
              if (uuidController.text.length > 0) {
                print('提交${uuidController.text}');
              } else {
                print('提交失败');
              }
            },
          ),
        )
      ],
    );
  }
}
