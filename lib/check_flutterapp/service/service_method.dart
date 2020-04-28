import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterapp/check_flutterapp/config/service_url.dart';


// 通用网络获取数据方法
Future request(url, {formData}) async {
 /* try {
    print('开始获取数据......');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    if (FormData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常。');
    }
  }catch(e){
    return print('Error: ==============${e}');
  }*/
}


// 网络获取 home 页面数据
Future getHomePageContent() async {
  try {
    print('开始过去首页数据.................');
    Response response;
    Dio dio = new Dio();
    //    dio.options.contentType = ContentType.parse("application/x-www-for-urlencoded");
    dio.options.contentType = 'application/x-www-for-urlencoded';
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    response = await dio.post(servicePath['homePageContent'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常。');
    }
  } catch (e) {
    return print('ERROR：==========>${e}');
  }
}
