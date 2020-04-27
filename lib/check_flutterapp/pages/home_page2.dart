import 'dart:convert';
import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutterapp/check_flutterapp/service/service_method.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2>
    with AutomaticKeepAliveClientMixin {
  String homePageContent = '正在获取数据';

  int page = 1;
  List<Map> hotGoodsList = [];

  @override
  void initState() {
    super.initState();
    // 网络获取火爆专区商品列表
    _getHotGoods();

  }

  // 让新界面重新点击不刷新
  @override
  bool get wantKeepAlive => true;

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

          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SwiperDiy(),
                TopNavigator(navigatorList: gavgatorList),
                AdBanner(),
                Recommend(),
                FloorTitle(),
                FloorContent(),
                _hotGoods(), // 火爆商品

              ],
            ),
          ); // 添加 SingleChildScrollView 防止越界
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

  // 通过网络获取火爆商品列表
  void _getHotGoods() {
    var formData = {'page': page};
    request('homePageBelowConten', FormData: formData).then((val) {
      var data = json.decode(val.toString());
      List<Map> newGoodsList = (data['dat'] as List).cast();
      setState(() {
        hotGoodsList.addAll(newGoodsList);
        page++;
      });
    });
  }

  // 设置标题
  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10.0),
    padding: EdgeInsets.all(5.0),
    alignment: Alignment.center,
    color: Colors.transparent,
    child: Text('火爆专区'),
  );

  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.only(bottom: 3.0),
            child: Column(
              children: <Widget>[
                Image.network(
                  val['image'],
                  width: ScreenUtil().setWidth(370),
                ),
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text('￥${val['mallPrice']}'),
                    Text(
                      '￥${val['price']}',
                      style: TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration
                              .lineThrough), // 添加 lineThrough 划线效果
                    )
                  ],
                )
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

  // 火爆专区组合布局
  Widget _hotGoods(){
   return Container(
     child: Column(
       children: <Widget>[
         hotTitle,
         _wrapList(),
       ],
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
            return Image.asset('images/load2.png', fit: BoxFit.fill);
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

/**
 *  广告栏
 */
class AdBanner extends StatelessWidget {
  final String adPicture;

  AdBanner({Key key, this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Image.asset('images/Banner.png'));
  }
}

/**
 *  商品推荐类
 */
class Recommend extends StatelessWidget {
  List recommedList = <String>[
    'http://forum.xitek.com/pics/202003/98672/9867214/thumb_9867214_1585272562.jpg',
    'http://forum.xitek.com/pics/202003/2876/287616/thumb_287616_1585233278.jpg',
    'http://forum.xitek.com/pics/202003/2225/222584/thumb_222584_1585232569.jpg'
  ];

  Recommend({Key key, this.recommedList}) : super(key: key);

  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 2.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  // 商品单独项方法
  Widget _item() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(left: BorderSide(width: 0.2, color: Colors.grey))),
        child: Column(
          children: <Widget>[
            Image.asset('images/shangping.png'),
            Text('￥${269}'),
            Text(
              '￥${385}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  // 横向列表方法
  Widget _recommedList() {
    return Container(
        height: ScreenUtil().setHeight(350),
        margin: EdgeInsets.only(top: 1.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return _item();
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(430),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommedList(),
        ],
      ),
    );
  }
}

/**
 *  楼层标题
 */
class FloorTitle extends StatelessWidget {
  String picture_address;

  FloorTitle({Key key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.asset('images/hengfu.png'),
    );
  }
}

/**
 *  商品广告列表
 */
class FloorContent extends StatelessWidget {
  List floorGoodsList = [
    'http://forum.xitek.com/pics/202003/98672/9867214/thumb_9867214_1585272562.jpg',
    'http://forum.xitek.com/pics/202003/2876/287616/thumb_287616_1585233278.jpg',
    'http://forum.xitek.com/pics/202003/2225/222584/thumb_222584_1585232569.jpg'
        'http://forum.xitek.com/pics/202003/2225/222584/thumb_222584_1585232569.jpg'
        'http://forum.xitek.com/pics/202003/2225/222584/thumb_222584_1585232569.jpg'
        'http://forum.xitek.com/pics/202003/2225/222584/thumb_222584_1585232569.jpg'
        'http://forum.xitek.com/pics/202003/2225/222584/thumb_222584_1585232569.jpg'
  ];

  FloorContent({Key key, this.floorGoodsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
          _otherGoods(),
        ],
      ),
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _goodsItem(null),
        Column(
          children: <Widget>[
            _goodsItem(null),
            _goodsItem(null),
          ],
        )
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: <Widget>[
        _goodsItem(null),
        _goodsItem(null),
      ],
    );
  }

  Widget _goodsItem(Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          print('点击了楼层商品');
        },
        child: Image.asset('images/shangping2.png'),
      ),
    );
  }
}
