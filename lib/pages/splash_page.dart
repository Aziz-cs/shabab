import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shabab/pages/quran_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => QuranPage()),
      );
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/book_cover.jpg',
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
