import 'package:flutter/material.dart';
import 'package:weather_app/core/models/route_utils/route_utils.dart';
import 'package:weather_app/view/splash/view.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: RouteUtils.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
