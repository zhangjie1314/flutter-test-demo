import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ZToast {
  static show({
    @required String msg,
    Toast toastLength = Toast.LENGTH_SHORT,
    int timeInSecForIosWeb = 3,
    double fontSize = 16.0,
    ToastGravity gravity = ToastGravity.CENTER,
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: timeInSecForIosWeb,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: ScreenUtil().setSp(fontSize),
    );
  }
}
