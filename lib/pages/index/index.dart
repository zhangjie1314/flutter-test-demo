import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './comps/appointment.dart';
import './comps/community.dart';
import './comps/mine.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreen createState() => _IndexScreen();
}

class _IndexScreen extends State<IndexScreen> {
  int __curIdx = 0;
  List _pageList = [
    AppoinmentPage(),
    Community(),
    Mine(),
  ];
  Object _userInfo = {};

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // 获取用户信息
      _userInfo = prefs.getString('userInfo') == null
          ? {}
          : prefs.getString('userInfo');
      // 判断是否登陆
      if (_userInfo.toString() == '{}') {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[__curIdx],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), title: Text('约吧')),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility), title: Text('社区')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), title: Text('我的')),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: __curIdx,
        onTap: (idx) {
          setState(() {
            __curIdx = idx;
          });
          print(idx);
        },
      ),
    );
  }
}
