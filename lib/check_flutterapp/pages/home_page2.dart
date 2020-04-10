import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp/check_flutterapp/service/service_method.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  String homePageContent = '正在获取数据';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('百姓生活+')),
      body: FutureBuilder(
        future: getHomePageContent(),
        builder: (context, snapshot) {
          print("snapshot == " + snapshot.toString());
          print("snapshot.hasData == " + snapshot.hasData.toString());

          List<Map> gavgatorList = new List<Map>();
          for (var i = 0; i < 10; i++) {
            Map companys = {'first': '阿里巴巴', 'second': '腾讯', 'fifth': '百度'};
            gavgatorList.add(companys);
          }

          return Column(
            children: <Widget>[
              SwiperDiy(),
              TopNavigator(navigatorList: gavgatorList)
            ],
          );
          /*   if(snapshot.hasData){
            return Column(
              children: <Widget>[
                SwiperDiy()
              ],
            );
          }else{
            return Center(
              child: Text('加载中...'),
            );
          }*/
        },
      ),
    );
  }
}

/**
 *  首页轮播图片组件
 */
class SwiperDiy extends StatelessWidget {
  List<String> swiperDateList = <String>[
    'http://forum.xitek.com/pics/202003/98672/9867214/thumb_9867214_1585272562.jpg',
    'http://forum.xitek.com/pics/202003/2876/287616/thumb_287616_1585233278.jpg',
    'http://forum.xitek.com/pics/202003/2225/222584/thumb_222584_1585232569.jpg'
  ];

// SwiperDiy({Key key, this.swiperDateList}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    // 使用flutter界面尺寸框架
    ScreenUtil.init(context, width: 750, height: 1334);
    return Container(
      height: ScreenUtil().setHeight(500),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network("${swiperDateList[index]}", fit: BoxFit.fill);
          },
          itemCount: swiperDateList.length,
          pagination: SwiperPagination(), // 导航器（...）
          autoplay: true // 自动播放
          ),
    );
  }
}

/**
 * GridView 类别导航组件
 */
class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print("点击了导航");
      },
      child: Column(
        children: <Widget>[
          Image.asset('images/load2.png', width: ScreenUtil().setWidth(95)),
         /* Image.network(
              'http://img2.imgtn.bdimg.com/it/u=3342460388,4287062980&fm=26&gp=0.jpg',
              width: ScreenUtil().setWidth(95)),*/
          Text('type')
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}
