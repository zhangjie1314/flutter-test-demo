import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Community extends StatefulWidget {
  @override
  _Community createState() => _Community();
}

class _Community extends State<Community> with TickerProviderStateMixin {
  List _bannerList = [
    'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage05.jpg',
    'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg',
    'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage07.jpg'
  ];
  List<String> _tabs = <String>[
    "最新",
    "关注",
  ];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    //TabBar监听器
    _tabController.addListener(() => print('tab click!'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          bottom: PreferredSize(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 4,
                  indicatorColor: Color(0xff21b8c5),
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                  isScrollable: true,
                  labelColor: Color(0xff21b8c5),
                  labelStyle: TextStyle(fontSize: 20),
                  controller: _tabController,
                  tabs: _tabs
                      .map((String name) => Tab(
                            text: name,
                          ))
                      .toList(),
                  unselectedLabelColor: Color(0xff666666),
                  unselectedLabelStyle:
                      TextStyle(color: Color(0xff666666), fontSize: 14),
                ),
              ],
            ),
            preferredSize: Size(100, 50),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.only(
                top: 110.0, left: 20.0, right: 20.0, bottom: 40.0),
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
          title: Text(
            '社区',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30.00,
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          expandedHeight: 310.0,
          centerTitle: false,
          pinned: true,
          snap: false,
          elevation: 0,
          actions: <Widget>[
            IconButton(
                color: Colors.grey,
                icon: Icon(Icons.search),
                onPressed: () {
                  print('搜索');
                }),
          ],
        ),
        // SliverFixedExtentList(
        //   itemExtent: 50,
        //   delegate: SliverChildBuilderDelegate(mySliverBuildFun),
        // )
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return _buildItem(index);
          }),
        )
      ],
    ));
  }

  Widget _buildItem(int index) {
    return Container(
      alignment: Alignment(0, 0),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white),
      child: Text('data $index'),
    );
  }
}
