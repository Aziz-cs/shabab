import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shabab/pages/splash_page.dart';
import 'package:shabab/utils/sharedprefs.dart';

import 'pages/quran_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  // if (Platform.isAndroid) {
  //   await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تفسير للشباب',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Din',
        primarySwatch: Colors.grey,
      ),
      home: const SplashPage(),
    );
  }
}
