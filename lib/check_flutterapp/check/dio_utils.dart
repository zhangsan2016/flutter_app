import 'package:dio/dio.dart';

/*
 * 封装 restful 请求
 *
 * GET、POST、DELETE、PATCH
 * 主要作用为统一处理相关事务：
 *  - 统一处理请求前缀；
 *  - 统一打印请求信息；
 *  - 统一打印响应信息；
 *  - 统一打印报错信息；
 */
class DioUtils {
  /// global dio object
  static Dio dio;

  /// default options
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 30000;

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// 创建 dio 实例对象
  static Dio createInstance({token}) {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      Map<String, dynamic> httpHeaders = {
        'Accept-Encoding': 'gzip,deflate',
//        'content-type': 'application/json',
        'content-type': "application/json",
        'X-auth-token': token
      };

      var options = BaseOptions(
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT,
          responseType: ResponseType.json,
          validateStatus: (status) {
            // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
            return true;
          },
          headers: httpHeaders);

      dio = new Dio(options);
    }

    return dio;
  }

  ///Get请求
  static void getHttp<T>(
    String url, {
    token,
    parameters,
    Function(String) onSuccess,
    Function(String error) onError,
  }) async {
    ///定义请求参数
    parameters = parameters ?? {};
    //参数处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    try {
      Response response;
      Dio dio = createInstance(token: token);
      response = await dio.get(url, queryParameters: parameters);
      var responseData = response.data;
      if (responseData['erroCode'] == 2000) {
        if (onSuccess != null) {
          onSuccess(responseData['result']);
        }
      } else {
        throw Exception('erroMsg:${responseData['erroMsg']}');
      }
      print('响应数据：' + response.toString());
    } catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
    }
  }

  ///Post请求
  static void postHttp<T>(
    String url, {
    token,
    parameters,
    Function(String) onSuccess,
    Function(String error) onError,
  }) async {
    /*  ///定义请求参数
    parameters = parameters ?? {};
    //参数处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });*/

    try {
      Response response;
      Dio dio = createInstance(token: token);

      if (parameters != null && parameters.isNotEmpty) {
        response = await dio.post(url, data: parameters);
      } else {
        response = await dio.post(url);
      }
      print('响应数据：$response');
      //   var responseData = response.data;
      if (onSuccess != null) {
        // onSuccess(responseData['result']);
        onSuccess(response.toString());
      }
    } catch (e) {
      print('请求出错：' + e.toString());
      onError(e.toString());
      throw e;
    }
  }

  /// request Get、Post 请求
  //url 请求链接
  //parameters 请求参数
  //method 请求方式
  //onSuccess 成功回调
  //onError 失败回调
  static void requestHttp<T>(String url,
      {token,
      parameters,
      method,
      Function(String t) onSuccess,
      Function(String error) onError}) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';

    if (method == DioUtils.GET) {
      getHttp(
        url,
        token: token,
        parameters: parameters,
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (error) {
          onError(error);
        },
      );
    } else if (method == DioUtils.POST) {
      postHttp(
        url,
        token: token,
        parameters: parameters,
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (error) {
          onError(error);
        },
      );
    }
  }
}

void main() {
  /* //  String postBody = "{\"where\":{\"PROJECT\":\"" + title + "\"},\"size\":5000}";
  var param = {'taskCode ': 'XC202001020003'};

  DioUtils.requestHttp(
    "",
    token: '',
    parameters: param,
    method: DioUtils.GET,
    onSuccess: (data) {},
    onError: (error) {},
  );*/

  List<String> childCategoryList = [];


  print('object ${childCategoryList.length} ');


}
