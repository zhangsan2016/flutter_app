import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List searchList = <String>['keji-科技', 'yule-娱乐', 'xinwen-新闻'];
List defaultValue = <String>['推荐1', '推荐2'];

class SearchBarDemo extends StatefulWidget {
  @override
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索案例'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBar());
            },
          ),
        ],
      ),
    );
  }
}

class SearchBar extends SearchDelegate {
  //复写点击搜索框右侧图标方法,此方法也就是点击右侧图标的回调函数,点击右侧图标把搜索内容情空
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        //点击后清除搜索框内容
        onPressed: () => query = '',
      ),
    ];
  }

  //点击搜索框右侧的图标,案例这里放的是返回按钮
  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  //点击了搜索显示的页面
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      width: 100.0,
      height: 100.0,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  //提示性文字内容
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //判断是否输入了内容，如果没有就显示默认的，输入了内容就从数组中查找返回
    final result = query.isEmpty
        ? defaultValue
        : searchList.where((value) => value.startsWith(query)).toList();
    print(result);

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (context, index) => ListTile(
        title: RichText(
          //把搜索到的字符截取出来加粗
          text: TextSpan(
            text: result[index].substring(0, query.length),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            //未搜索到的内容
            children: [TextSpan(
              text: result[index].substring(query.length),
              style: TextStyle(color: Colors.grey),
            )],
          ),
        ),
      ),
    );
  }
}