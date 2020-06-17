import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_seekbar/seekbar/seekbar.dart';

import 'cc.dart';
import 'ee.dart';

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
  var _newValue = '语文';

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    String radioValue = '普通';
    return SingleChildScrollView(
      child: checkLampPage(),
    );
  }

  TextEditingController _lampUUid = TextEditingController();
  TextEditingController _lampName = TextEditingController();
  TextEditingController _lampLongitude = TextEditingController();
  TextEditingController _lampLatitude = TextEditingController();
  TextEditingController _lampProject = TextEditingController();
  TextEditingController _lampSuperUUID = TextEditingController();
  TextEditingController _lampDiameter = TextEditingController();
  // 电源出厂商
  TextEditingController _powerManufacturers = TextEditingController();
  // 额定电流
  TextEditingController _lampRatedCurrent = TextEditingController();
  // 额定电压
  TextEditingController _lampNominalVoltage  = TextEditingController();
  // 额定类型
  TextEditingController _lampType = TextEditingController();
  // 灯具出厂商
  TextEditingController _lampTheVendor = TextEditingController();
  // 灯具数
  TextEditingController _lampNum  = TextEditingController();
  // 灯具出厂日期
  TextEditingController _lampDateOfProduction = TextEditingController();
  // 灯具高度
  TextEditingController _lampHeight = TextEditingController();
  // 灯具总额定功率
  TextEditingController _lampTotalFixedPower= TextEditingController();
  // 灯具出厂日期
  TextEditingController _lampCommunicationMode= TextEditingController();
  Widget editLampPage() {
    num textSzie = ScreenUtil().setSp(22);
    return new Container(
        width: ScreenUtil().setWidth(double.infinity),
        padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30.0),
        decoration: new BoxDecoration(
          color: Color.fromARGB(240, 11, 29, 77),
        ),
        child: Column(children: <Widget>[

          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('UUID', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 30,
                  ),
                  child: TextField(
                    controller: _lampUUid,
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
              ),
            ],
          ),


          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('名称', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampName,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),



          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('类型', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child:_getText('  2',textSzie),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('经度', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampLongitude,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),



          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('纬度', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampLatitude,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('项目', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampProject,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('父设备UUID', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampSuperUUID,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('灯杆直径', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampDiameter,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('电源出厂商', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _powerManufacturers,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('灯具额定电流', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampRatedCurrent,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('灯具额定电压', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampNominalVoltage,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('灯具类型', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampType,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('灯具出厂商', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampTheVendor,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),



          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('灯具数', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampNum,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('灯具出厂日期', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampDateOfProduction,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('灯具高度', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampHeight,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),



          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('总额定功率', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampTotalFixedPower,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),


          Container(
            margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  width: ScreenUtil().setWidth(150),
                  child: _getText('通讯方式', textSzie),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  width: ScreenUtil().setWidth(500),
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 30,
                    ),
                    child: TextField(
                      controller: _lampCommunicationMode,
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
                          fontSize: ScreenUtil().setSp(25),
                          color: Colors.white),
                      cursorColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),



          new Container(
            margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
            height: ScreenUtil().setHeight(70),
            width: ScreenUtil().setWidth(600),
            child: RaisedButton(
              child: Text('保存'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {


              /*  TextEditingController _lampUUid = TextEditingController();
                TextEditingController _lampName = TextEditingController();
                TextEditingController _lampLongitude = TextEditingController();
                TextEditingController _lampLatitude = TextEditingController();
                TextEditingController _lampProject = TextEditingController();
                TextEditingController _lampSuperUUID = TextEditingController();
                TextEditingController _lampDiameter = TextEditingController();
                // 电源出厂商
                TextEditingController _powerManufacturers = TextEditingController();
                // 额定电流
                TextEditingController _lampRatedCurrent = TextEditingController();
                // 额定电压
                TextEditingController _lampNominalVoltage  = TextEditingController();
                // 额定类型
                TextEditingController _lampType = TextEditingController();
                // 灯具出厂商
                TextEditingController _lampTheVendor = TextEditingController();
                // 灯具数
                TextEditingController _lampNum  = TextEditingController();
                // 灯具出厂日期
                TextEditingController _lampDateOfProduction = TextEditingController();
                // 灯具高度
                TextEditingController _lampHeight = TextEditingController();
                // 灯具总额定功率
                TextEditingController _lampTotalFixedPower= TextEditingController();
                // 灯具出厂日期
                TextEditingController _lampCommunicationMode= TextEditingController();*/

                print('== ${_lampUUid.text}     ${_lampName.text}    ${_lampLongitude.text}');
                if (uuidController.text.length > 0) {
                  print('保存${uuidController.text}');
                } else {
                  print('保存失败');
                }
              },
            ),
          ),
        ]));




  }

  Widget checkLampPage() {
    num textSzie = ScreenUtil().setSp(22);
    return new Container(
      width: ScreenUtil().setWidth(double.infinity),
      padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30.0),
      decoration: new BoxDecoration(
        color: Color.fromARGB(240, 11, 29, 77),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                color: Colors.cyan,
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('UUID', textSzie),
              ),
              Container(
                color: Colors.cyan,
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText(
                    '54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('名称', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('在线', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('版本号', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('电压', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('电压', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('电流', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('功率', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('电能', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('漏电电流', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('预警状态', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('传感器错', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('全局亮度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('主灯亮度值', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('副灯亮度值', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('灯光告警模式', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('汇报时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('照度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('温度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('湿度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('频率', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('照度锁', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('GPS开灯时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('GPS关灯时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('分组', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('Gprs csq', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('基站经度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('GPS经度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('GPS纬度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('类型', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('经度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('纬度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('主一时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('主一亮度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('主二时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('主二亮度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('主三时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('主三亮度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('主四时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('主四亮度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('主五时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('主五亮度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('主六时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('主六亮度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('辅一时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('辅一亮度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('辅二时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('辅二亮度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('辅三时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('辅三亮度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('辅四时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('辅四亮度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('辅五时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('辅五亮度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('辅六时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('辅六亮度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('项目', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('父设备UUID', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('灯杆直径', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('电源出厂商', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('灯具额定电流', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('灯具额定电压', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('灯具类型', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('灯具出厂商', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('灯具数', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('灯具出厂时间', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('灯杆高度', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('总额定功率', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(150),
                child: _getText('通讯方式', textSzie),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                width: ScreenUtil().setWidth(500),
                alignment: Alignment.centerLeft,
                child: _getText('54154sdf546sd4f6465sd4f564ds654f654ss4', textSzie),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getText(String text, num textSzie) {
    return Text(text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            decorationStyle: TextDecorationStyle.solid,
            fontSize: textSzie,
            color: Colors.white));
  }

  Widget buildTextField() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(22), ScreenUtil().setHeight(22), 0.0, 0.0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
//            borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
            )),
        style: TextStyle(fontSize: ScreenUtil().setSp(45), color: Colors.white),
        cursorColor: Colors.blue,
      ),
    );
  }
}
