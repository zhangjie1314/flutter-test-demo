import 'package:flutter/material.dart';
import '../pages/index/index.dart';
import '../pages/second/index.dart';
import '../pages/login/index.dart';

class NameRouter {
  static Map<String, WidgetBuilder> routes;

  // 初始化app
  static Widget initApp() {
    return MaterialApp(
      initialRoute: '/',
      routes: NameRouter.initRoutes(),
    );
  }

  // 初始化路由
  static initRoutes() {
    routes = {
      '/': (context) => IndexScreen(),
      '/login': (context) => LoginPage(),
      '/second': (context) => SecondPage(),
    };
    return routes;
  }
}
