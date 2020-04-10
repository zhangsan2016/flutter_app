import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterapp/check_flutterapp/config/service_url.dart';

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
