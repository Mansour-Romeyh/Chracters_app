import 'package:blooc/const/approut/Approute.dart';
import 'package:blooc/presentation/screen/homescreen%20copy.dart';
import 'package:blooc/presentation/screen/homescreen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.home_screen: (context) => HomeScreen(),
  AppRoute.home2_screen: (context) => HomeScreen2(),
};
