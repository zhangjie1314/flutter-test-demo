import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_test_app/http/index.dart';
import 'package:flutter_test_app/config/apis.dart';
import 'package:flutter_test_app/util/ToastUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _password;
  var _obscureText = true;
  var _passIcon = Icons.remove_red_eye;

  void loginFun() async {
    var _form = _formKey.currentState;
    if (_form.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _form.save();
      var data = {'username': _name, 'password': _password};
      var res = await DioUtil().post(Apis.Login, data: data);
      Map<String, dynamic> userInfo = json.decode(res.toString());
      if (userInfo['code'] != 0) {
        ZToast.show(msg: userInfo['msg']);
      } else {
        prefs.setString('userInfo', userInfo.toString());
        Navigator.pushNamedAndRemoveUntil(context, '/', (el) {
          print(el);
          return;
        });
      }
    }
  }

  void haldenNameInput(val) {
    setState(() {
      _name = val;
    });
  }

  void haldenPasswordInput(val) {
    setState(() {
      _password = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff313340),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Color(0x00000000),
                    padding: EdgeInsets.all(0),
                    textColor: Colors.white,
                    elevation: 0.0,
                    highlightElevation: 0.0,
                    highlightColor: Color(0x00000000),
                    splashColor: Color(0x00000000),
                    child: Text(
                      '注册',
                      style: TextStyle(fontSize: 12),
                    ),
                    onPressed: () {
                      print('object 注册');
                    },
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    '教练登陆',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: '手机号',
                          labelStyle: TextStyle(color: Colors.white)),
                      onSaved: haldenNameInput,
                      validator: (val) {
                        const _regExp =
                            r"^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$";
                        if (val == '') {
                          return '请输入手机号！';
                        }
                        if (!RegExp(_regExp).hasMatch(val)) {
                          return '请输入正确的手机号码！';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: '密码',
                          labelStyle: TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                            color: Colors.white,
                            icon: Icon(_passIcon),
                            onPressed: () {
                              setState(() {
                                // _passIcon = Icons;
                                _obscureText = !_obscureText;
                              });
                            },
                          )),
                      obscureText: _obscureText,
                      validator: (val) {
                        return val.length < 6 ? "密码长度错误" : null;
                      },
                      onSaved: haldenPasswordInput,
                    ),
                    RaisedButton(
                      highlightElevation: 0.0,
                      elevation: 0.0,
                      child: Text('登陆'),
                      onPressed: loginFun,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
