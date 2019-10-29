import 'package:flutter/material.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('首页容器'),
            RaisedButton(
              child: Text('跳转到第二页面'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            )
          ],
        ),
      ),
    );
  }
}
