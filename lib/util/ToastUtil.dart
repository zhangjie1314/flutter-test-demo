import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ZToast {
  static show({
    @required String msg,
    Toast toastLength,
    int timeInSecForIos = 3,
    double fontSize = 16.0,
    ToastGravity gravity,
    Color backgroundColor,
    Color textColor,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 3,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
