import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../dio_utils.dart';
import '../service_url.dart';
import 'lamp_info.dart';

class GroupingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return new MaterialApp(
        // 去掉运行时 debug 的提示
        debugShowCheckedModeBanner: false,
        title: '洛丁智慧照明',
        home: new Scaffold(
          appBar: new AppBar(
            //自定义Drawer的按钮
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    onPressed:
                    () => Navigator.of(context).pop();
                  });
            }),
            title: new Text('洛丁智慧照明'),
            centerTitle: true,
            backgroundColor: Colors.cyan,
          ),
          body: MyGroupingPage(),
        ));
  }
}

class MyGroupingPage extends StatefulWidget {

  @override
  _MyGroupingPageState createState() => _MyGroupingPageState();
}

class _MyGroupingPageState extends State<MyGroupingPage> {
  // 当前路灯数据
  List<Lamp> lamps = [];


  _MyGroupingPageState();


  @override
  void initState() {
    super.initState();
    // 网络获取当前项目路灯数据
    getDeviceLampList('中科洛丁展示项目/深圳展厅');


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
      decoration: new BoxDecoration(
        color: Color.fromARGB(255, 11, 29, 77),
      ),
      child: ListView(
        children: getGroup(),
      ),
    );
  }

  // 设置标题
  Widget groupTitle( String title) {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.all(5.0),
        color: Colors.transparent,
        child: Text(title,style: TextStyle(color: Colors.white),));
  }

  Widget _wrapList() {
    if (lamps?.length != 0) {
      List<Widget> listWidget = lamps.map((val) {
        Lamp lamp = val;
        return InkWell(
          onTap: () {
            print('${lamp.nAME} lamp.lAT ： ${lamp.lAT} lamp.lNG ：${lamp.lNG}');
          },
          child: Container(
            //width: ScreenUtil().setWidth(150),
            color: Color.fromARGB(255, 37, 70, 131),
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Text(
                  lamp.nAME,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black, fontSize: ScreenUtil().setSp(26)),
                ),
              ],
            ),
          ),
        );
      }).toList();

      // 返回流式布局
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }


  /**
   *  获取项目下的路灯列表
   */
  getDeviceLampList(String title) {


      var param = "{\"where\":{\"PROJECT\":\"" + title + "\"},\"size\":1000}";


      DioUtils.requestHttp(
        servicePath['DEVICE_LAMP_LIST_URL'],
        parameters: param,
       // token: token,
        token: 'f2b562c0-b1d7-11ea-84e6-399675d2b894',
        method: DioUtils.POST,
        onSuccess: (String data) {
          // 解析 json
          var jsonstr = json.decode(data);
          // print('getDeviceLampList title $title = $data');
          print('getDeviceLampList title $title ');

          LampInfo lampInfo = LampInfo.fromJson(jsonstr);

          setState(() {
            lamps = lampInfo.data.lamp;
          });

        },
        onError: (error) {
          print(' DioUtils.requestHttp error = $error');
        },
      );


  }

 List<Widget> getGroup() {
    List<Widget> list =[];
    list.add(groupTitle('默认分组'));
    list.add(_wrapList());
    list.add(groupTitle('未分组'));
    list.add(_wrapList());
    return list;

  }
}
