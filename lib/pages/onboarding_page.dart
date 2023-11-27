import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.blueGrey.shade900,
        title: const Text('تصريح الأزهر الشريف بالنشر',
            style: TextStyle(color: Colors.white, fontSize: 19, height: 0.2)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: PageView(
          children: [
            Column(
              children: [
                Expanded(child: Image.asset('assets/images/azhar_agree.jpeg')),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('التالي'),
                )
              ],
            ),
            Image.asset('assets/images/azhar_agree.jpeg'),
          ],
        ),
      ),
    );
  }
}
