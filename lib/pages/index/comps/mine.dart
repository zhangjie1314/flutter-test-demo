import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class Mine extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Mine();
  }
}

class _Mine extends State<Mine> {
  List<Map> _menuLists = [
    {'title': '我的教练', 'icon': Icons.accessibility, 'showArrowIcon': true},
    {'title': '我的俱乐部', 'icon': Icons.business, 'showArrowIcon': true},
    {'title': '账号与安全', 'icon': Icons.security, 'showArrowIcon': true},
    {'title': '联系客服', 'icon': Icons.perm_phone_msg, 'showArrowIcon': true},
    {'title': '关于怦怦', 'icon': Icons.info, 'showArrowIcon': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            color: Color(0xff666666),
            icon: Icon(Icons.center_focus_strong),
            onPressed: _scanCode,
          ),
          IconButton(
            color: Color(0xff666666),
            icon: Icon(Icons.message),
            onPressed: () {
              print('消息中心');
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[100]),
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 10.0,
        ),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Align(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '王浩高级私人教练',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '这个人很懒，什么也没这个人很懒，什么也没有…',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FlatButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    print('个人主页!');
                  },
                  textColor: Color(0xffaaaaaa),
                  child: Row(
                    children: <Widget>[
                      Text('个人主页'),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '99',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'DINCondensedBold',
                          ),
                        ),
                        Text(
                          '关注',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff999999),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '27',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'DINCondensedBold',
                          ),
                        ),
                        Text(
                          '粉丝',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff999999),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '1',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'DINCondensedBold',
                          ),
                        ),
                        Text(
                          '动态',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff999999),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'DINCondensedBold',
                          ),
                        ),
                        Text(
                          '积分',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff999999),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xfff1f4f5),
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                bottom: 12,
                right: 16,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          print('私教预约');
                        },
                        child: Column(
                          children: <Widget>[
                            Align(
                              child: CircleAvatar(
                                radius: 24,
                                backgroundImage: NetworkImage(
                                    'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                '私教预约',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff666666),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          print('我的赛事');
                        },
                        child: Column(
                          children: <Widget>[
                            Align(
                              child: CircleAvatar(
                                radius: 24,
                                backgroundImage: NetworkImage(
                                    'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                '我的赛事',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff666666),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          print('体侧报告');
                        },
                        child: Column(
                          children: <Widget>[
                            Align(
                              child: CircleAvatar(
                                radius: 24,
                                backgroundImage: NetworkImage(
                                    'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                '体侧报告',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff666666),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 10,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffF1FAFF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.phone_iphone,
                              size: 30,
                              color: Color(0xff0daeff),
                            ),
                            Text(
                              '绑定手机号，确保账号安全',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff0daeff),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          top: -20,
                          right: -10,
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Color(0xff0daeff),
                              size: 14,
                            ),
                            onPressed: () {
                              print('close');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  print('点击广告');
                },
                child: Container(
                  height: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children:
                    _menuLists.map((Map item) => _menuItem(item)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 菜单item
  Widget _menuItem(Map item) {
    return GestureDetector(
      onTap: () {
        print(item['title']);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: <Widget>[
            Icon(
              item['icon'],
              color: Color(0xff666666),
              size: 26,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  item['title'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff333333),
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Color(0xffEBEBEB),
            ),
          ],
        ),
      ),
    );
  }

  // 扫描二维码方法
  void _scanCode() async {
    try {
      String barcode = await BarcodeScanner.scan();
      print('扫描结果:');
      print('扫描结果:$barcode');
    } on PlatformException catch (e) {
      // print('未授APP权相机权限: $e');
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        print('未授APP权相机权限');
      } else {
        print('扫码错误: $e');
      }
    } on FormatException {
      print('进入扫码页后未扫码直接返回');
    } catch (e) {
      print('扫码错误! $e');
    }
  }
}
