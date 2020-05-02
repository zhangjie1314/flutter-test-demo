import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class AppoinmentPage extends StatefulWidget {
  @override
  _AppoinmentPage createState() => _AppoinmentPage();
}

class _AppoinmentPage extends State<AppoinmentPage> {
  List _bannerList = [
    'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage05.jpg',
    'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg',
    'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage07.jpg'
  ];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // 上啦加载
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('到达地步!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('约私教'),
        centerTitle: false,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        textTheme: TextTheme(
            title: TextStyle(
                color: Colors.black,
                fontSize: 30.00,
                fontWeight: FontWeight.w600)),
      ),
      body: RefreshIndicator(
        child: ListView(
          controller: _scrollController,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                child: ConstrainedBox(
                  constraints: BoxConstraints.loose(
                      Size(MediaQuery.of(context).size.width * 0.07, 180.0)),
                  child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network('${_bannerList[index]}',
                            fit: BoxFit.cover);
                      },
                      itemCount: 3,
                      pagination: SwiperPagination(),
                      autoplay: true,
                      onIndexChanged: (int index) {
                        print(index);
                      },
                      onTap: (int index) {
                        print(index);
                      }),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: SizedBox(
                    height: 60.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  '周一',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                Text('12.23',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.grey[600])),
                                Container(
                                  width: 4.0,
                                  height: 4.0,
                                  margin: EdgeInsets.only(top: 10.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        }),
                  )),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 20,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 18.0, top: 16.0, right: 18.0, bottom: 16.0),
                    margin: EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10.0),
                                child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                        'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage04.jpg')),
                              ),
                              Positioned(
                                bottom: 2.0,
                                left: 3.0,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 2.0,
                                      bottom: 2.0,
                                      left: 8.0,
                                      right: 8.0),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0x80e4e4e4),
                                          blurRadius: 10.0,
                                          offset: Offset(0.0, 4.0))
                                    ],
                                    color: Color.fromRGBO(255, 255, 255, 0.7),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                  ),
                                  child: Text(
                                    '已认证',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xfff6a500)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '王浩高级私人教练$index',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '私课·团课·运动康复',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Color(0xff999999)),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    '增肌减脂塑性康复',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xff999999)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          flex: 1,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '好评率 100%',
                              style: TextStyle(
                                  fontSize: 12.0, color: Color(0xff00bc71)),
                            ),
                            Container(
                              alignment: Alignment(0, 0),
                              width: 60,
                              margin: EdgeInsets.only(top: 10.0),
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, bottom: 5, right: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xff21b8c5),
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: Text(
                                '约课',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        onRefresh: _onRefresh,
      ),
    );
  }

  // 下拉刷新
  Future<Null> _onRefresh() {
    setState(() {
      _bannerList = [
        'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage01.jpg',
        'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage02.jpg',
        'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage03.jpg'
      ];
    });
    return null;
  }
}
