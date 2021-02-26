import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:self_app_one/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioUtil {
  static DioUtil instance;
  Dio dio;
  BaseOptions options;

  CancelToken cancelToken = new CancelToken();

  static DioUtil getInstance() {
    if (instance == null) instance = new DioUtil();
    return instance;
  }

  getTokenStr() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = '';
    Map userInfo = prefs.getString('userInfo') != null
        ? jsonDecode(prefs.getString('userInfo'))
        : {};
    if (userInfo.isNotEmpty) {
      token = userInfo['token'];
    }
    return token;
  }

  DioUtil() {
    options = new BaseOptions(
      baseUrl: Config.apiHost,
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: {
        'Accept': 'application/json, text/plain, */*',
        'ver': '1.0.0',
      },
      contentType: "application/json;charset=UTF-8",
    );

    dio = new Dio(options);
    // cookie 管理
    dio.interceptors.add(CookieManager(CookieJar()));
    // 添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print('---------发起请求前-----------');
      print(options.headers);
      return options;
    }, onResponse: (Response response) {
      print('---------服务器返回-----------');
      print(response);
      return response;
    }, onError: (DioError e) {
      print('---------请求发生错误---------');
      return e;
    }));
  }

  // get请求
  get(url, {data, options, cancelToken}) async {
    Response response;
    print('get data--------------$data');
    try {
      options = Options(
        headers: {'token': await getTokenStr()},
      );
      response = await dio.get(
        url,
        queryParameters: data,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      print('get error--------------$e');
      formatError(e);
    }
    return response;
  }

  // post请求
  post(url, {data, options, cancelToken}) async {
    Response response;
    try {
      print('post data---------$data');
      options = Options(
        headers: {'token': await getTokenStr()},
      );
      response = await dio.post(
        url,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      print('post error---------$e');
      formatError(e);
    }
    return response;
  }

  // 下载文件
  downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
    } on DioError catch (e) {
      print('downloadFile error---------$e');
      formatError(e);
    }
    return response.data;
  }

  // 统一错误处理
  void formatError(DioError e) {
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      print('连接超时!');
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      print("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      print("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      // 404, 503
      print("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      print("请求取消");
    } else {
      print("未知错误");
    }
  }

  // 取消请求
  void cancelRequests(CancelToken token) {
    token.cancel('cancelled');
  }
}
