import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:self_app_one/http/index.dart';
import 'package:self_app_one/config/apis.dart';
import 'package:self_app_one/util/ToastUtil.dart';
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
        Navigator.of(context).pushReplacementNamed('/');
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
        backgroundColor: Color(0xff4B4D4D),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '密码登陆',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 70,
                        bottom: 20,
                      ),
                      child: TextFormField(
                        inputFormatters: [LengthLimitingTextInputFormatter(11)],
                        autofocus: true,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 16,
                            bottom: 16,
                          ),
                          hintText: '手机号码',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(40, 255, 255, 255),
                        ),
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontFamily: 'DINCondensedBold',
                        ),
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
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontFamily: 'DINCondensedBold',
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            color: Colors.white,
                            icon: Icon(_passIcon),
                            onPressed: () {
                              setState(() {
                                // _passIcon = Icons;
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 16,
                            bottom: 16,
                          ),
                          hintText: '登陆密码',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 0,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          filled: true,
                          fillColor: Color.fromARGB(40, 255, 255, 255),
                        ),
                        obscureText: _obscureText,
                        validator: (val) {
                          return val.length < 6 ? "密码长度错误" : null;
                        },
                        onSaved: haldenPasswordInput,
                      ),
                    ),
                    FlatButton(
                      onPressed: loginFun,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xff12B8C5),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 20,
                            bottom: 20,
                          ),
                          child: Align(
                            child: Text(
                              '登陆',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
