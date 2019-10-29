import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二页'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('这是第二页容器'),
      ),
    );
  }
}
