
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = new TextEditingController();

  String showText="请输入";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('类型中心'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '类型',
                    helperText: '请输入类型'),
                autofocus: false,
              ),
              RaisedButton(
                onPressed:_choiceAction,
                child: Text('选择完毕'),
              ),
              Text(
                showText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _choiceAction() {
    print('请选择类型...');
    if (typeController.text.toLowerCase() == '') {
      showDialog(context: context,
          builder: (context) => AlertDialog(title: Text('类型不能为空！'),));
    } else {
      getHttp().then((val) {
        setState(() {
          showText = val.toString();
        });
      });
    };
  }
}

Future getHttp() async {
  try {
    Response response;
    response = await Dio().post('http://121.40.194.91:8080/ldsight/deviceAction');
   // print("xxx Response =" + response.toString());
    return response.data;
  } catch (e) {
    return print(e);
  }
}


































