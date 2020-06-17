import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/check_flutterapp/check/service_url.dart';

import 'dio_utils.dart';

void main() => runApp(check());

class check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'xxx++',
        // 去掉运行时 debug 的提示
        debugShowCheckedModeBanner: false,

        home: HomePage22(),
      ),
    );
  }
}
class HomePage22 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getWidget(context);
  }

  Widget getWidget(BuildContext context) {
    List tabs = ["新闻", "历史", "图片"];

    return new DefaultTabController(
      length: tabs.length,
      child: new Scaffold(
        appBar: AppBar(
          title: Text("标题标题标题标题标题标题标题标题标题"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () =>  exit(0), //Navigator.of(context).pop(),
          ),
          elevation: 20.0,
          backgroundColor: Color(0xffDE331F),
          bottom: TabBar(
            //生成Tab菜单
              tabs: tabs.map((e) => Tab(text: e)).toList()),
        ),
        body: new TabBarView(
          children: tabs.map((e) {
            //分别创建对应的Tab页面
            return Container(
              alignment: Alignment.center,
             // child: Text(e, textScaleFactor: 5),
              child: Column(children: <Widget>[
                RaisedButton(child: Text(('网络连接')),onPressed: (){

                 // var param = "{\"where\":{\"PROJECT\":\"" + "中科洛丁展示项目/深圳展厅" + "\"},\"size\":1000}";
                 // var param = "{\"UUID\": \"" + '83140000862285035977879' + "\", \"Confirm\": 260, \"options\": {\"FirDimming\", 100} }";

                  var param =  "{\"UUID\": \"83140000862285035977879\",\"Confirm\": 260,\"options\": {\"FirDimming\": 0}}";

                  print('param = ${param.toString()}');

                  DioUtils.requestHttp(
//                    servicePath['DEVICE_CONTROL_URL'],
                 //   servicePath['DEVICE_LAMP_LIST_URL'],
                    "https://iot.sz-luoding.com:888/api/device/control",
                    parameters: param,
                    token: '9f23c610-a6d8-11ea-a5b2-6fc422f708c4',
                    method: DioUtils.POST,
                    onSuccess: (String data) {
                      // 解析 json
                  //    var jsonstr = json.decode(data);
                      // print('getDeviceLampList title $title = $data');
                      print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx DEVICE_CONTROL_URL $data ');

                    },
                    onError: (error) {
                      print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx DEVICE_CONTROL_URL DioUtils.requestHttp error = $error');
                    },
                  );

                },),
              ],),
            );
          }).toList(),
        ),
      ),
    );
  }


  /**
   *  获取项目下的报警器
   */
  getAlarmApparatus(String title, token) {
    var param = "{\"where\":{\"PROJECT\":\"" + title + "\"},\"size\":1000}";

    DioUtils.requestHttp(
      servicePath['DEVICE_WIRESAFE_LIST_URL'],
      parameters: param,
      token: token,
      method: DioUtils.POST,
      onSuccess: (String data) {
        try {
          // 解析 json
          print('getAlarmApparatus = ${data.toString()}');
          /*  var jsonstr = json.decode(data);
          EboxInfo lampInfo = EboxInfo.fromJson(jsonstr);
          if (!lampInfo.data.ebox?.isEmpty) {
            eboxMap[title] = lampInfo.data.ebox;
          }*/
        } catch (e) {
          print('解析出错 ${e.toString()}');
        }
      },
      onError: (error) {
        print(' DioUtils.requestHttp error = $error');
      },
    );
  }
}
