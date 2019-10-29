import 'package:flutter/material.dart';
import './router/index.dart';
import './config/config.dart';

void main() {
  Config.env = Env.PROD;
  runApp(NameRouter.initApp());
}
