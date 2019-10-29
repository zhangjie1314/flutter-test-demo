import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ZToast {
  static show(
      {@required String msg,
      Toast toastLength,
      int timeInSecForIos = 1,
      double fontSize = 16.0,
      ToastGravity gravity,
      Color backgroundColor,
      Color textColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
