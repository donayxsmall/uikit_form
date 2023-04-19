import 'package:uikit_form/state_util.dart';
import 'package:flutter/material.dart';

import 'constant.dart';
import 'module/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        primarySwatch: primary,
      ),
      home: const HomeView(),
    );
  }
}
