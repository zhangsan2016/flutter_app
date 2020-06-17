import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/check_flutterapp/pages/home_page.dart';
import 'package:flutterapp/check_flutterapp/pages/home_page2.dart';

import 'cc.dart';

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
    return SearchBarDemo();
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
            onPressed: () => exit(0), //Navigator.of(context).pop(),
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
              color: Colors.black,
              alignment: Alignment.center,
              child: DiscreteSetting(
                head: '设置地图中心点',
                options: ['广州', '北京', '上海'],
                onSelected: (value) {
                  switch (value) {
                    case '广州':
                      break;
                    case '北京':
                      break;
                    case '上海':
                      break;
                  }
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

/// 离散设置
class DiscreteSetting extends StatelessWidget {
  const DiscreteSetting({
    Key key,
    @required this.head,
    @required this.options,
    @required this.onSelected,
  }) : super(key: key);

  final String head;
  final List<String> options;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
     TextEditingController _lampUUid = TextEditingController();
    return PopupMenuButton<String>(
      onSelected: onSelected,
      child: Padding(
        padding: const EdgeInsets.all(16),
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
          style:
              TextStyle(fontSize:16, color: Colors.white),
          cursorColor: Colors.blue,
        ),
      ),
      itemBuilder: (context) {
        return options
            .map((value) => PopupMenuItem<String>(
                  child: Text(value),
                  value: value,
                ))
            .toList();
      },
    );
  }
}
