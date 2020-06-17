import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_seekbar/seekbar/seekbar.dart';

import 'AreaType.dart';

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
    return SingleChildScrollView(
      child: _controlView(),
    );
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
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
          new AreaType(
            textSzie: textSzie,
            childTopSpace: 0.0,
          ),
          Container(
            child: Row(
              children: <Widget>[
                _getText(' 清除报警    ', textSzie),
                new Container(
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(120),
                  child: RaisedButton(
                    child: _getText('清除', textSzie),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (uuidController.text.length > 0) {
                        print('清除报警${uuidController.text}');
                      } else {
                        print('清除报警失败');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, childTopSpace, 0, 0),
            child: Row(
              children: <Widget>[
                _getText(' 灯光告警    ', textSzie),
                new Container(
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(120),
                  child: RaisedButton(
                    child: _getText('关闭', textSzie),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (uuidController.text.length > 0) {
                        print('灯光告警关闭${uuidController.text}');
                      } else {
                        print('灯光告警关闭失败');
                      }
                    },
                  ),
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(120),
                  child: RaisedButton(
                    child: _getText('闪烁', textSzie),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (uuidController.text.length > 0) {
                        print('灯光告警闪烁${uuidController.text}');
                      } else {
                        print('灯光告警关闭闪烁');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, childTopSpace, 0, 0),
            child: Row(
              children: <Widget>[
                _getText('红外设置     ', textSzie),
                new Container(
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(120),
                  child: RaisedButton(
                    child: Text('关'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (uuidController.text.length > 0) {
                        print('红外设置关${uuidController.text}');
                      } else {
                        print('红外设置关失败');
                      }
                    },
                  ),
                ),
                new Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(120),
                  child: RaisedButton(
                    child: Text('开'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (uuidController.text.length > 0) {
                        print('红外设置开${uuidController.text}');
                      } else {
                        print('红外设置开失败');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, childTopSpace, 0, 0),
            child: Row(
              children: <Widget>[
                _getText('获取状态     ', textSzie),
                new Container(
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(120),
                  child: RaisedButton(
                    child: _getText('获取', textSzie),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (uuidController.text.length > 0) {
                        print('获取状态${uuidController.text}');
                      } else {
                        print('获取状态失败');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, childTopSpace, 0, 0),
            child: Row(
              children: <Widget>[
                _getText('角度校准     ', textSzie),
                Container(
                  width: 50,
                  child: new TextField(
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    cursorColor: Colors.purple,
                    cursorWidth: 6,
                    cursorRadius: Radius.elliptical(2, 8),
                    style: TextStyle(fontSize: ScreenUtil().setSp(26), color: Colors.white),
                  ),
                ),
                new Container(
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(120),
                  child: RaisedButton(
                    child: _getText('校准', textSzie),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (uuidController.text.length > 0) {
                        print('获取状态${uuidController.text}');
                      } else {
                        print('获取状态失败');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, childTopSpace, 0, 0),
            child: Row(
              children: <Widget>[
                _getText('   指令码       ', textSzie),
                Container(
                  width: 50,
                  child: new TextField(
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    cursorColor: Colors.purple,
                    cursorWidth: 6,
                    cursorRadius: Radius.elliptical(2, 8),
                    style: TextStyle(fontSize: ScreenUtil().setSp(26), color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, childTopSpace, 0, 0),
            child: Row(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(minWidth: 0, maxHeight: 75),
                  alignment: Alignment.topLeft,
                  child: _getText('      指令        ', textSzie),
                ),
                Container(
                  width:  ScreenUtil().setWidth(460),
                  child: TextField(
                    maxLines: 8,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5.0),
                        enabledBorder: OutlineInputBorder(
                          /*边角*/
                          borderRadius: BorderRadius.all(
                            Radius.circular(5), //边角为5
                          ),
                          borderSide: BorderSide(
                            color: Colors.white, //边线颜色为白色
                            width: 1, //边线宽度为2
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(25), color: Colors.white),
                    cursorColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

         Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Container(
                margin:  EdgeInsets.fromLTRB(0.0, 10, ScreenUtil().setWidth(70), 0),
                alignment: Alignment.centerRight,
                height: ScreenUtil().setHeight(50),
                width: ScreenUtil().setWidth(180),
                child: RaisedButton(
                  child: _getText('发送指令', textSzie),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    if (uuidController.text.length > 0) {
                      print('发送${uuidController.text}');
                    } else {
                      print('发送失败');
                    }
                  },
                ),
              ),
            ],
          ),



        ],
      ),
    );
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
