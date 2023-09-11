import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shabab/utils/content_data.dart';
import 'package:shabab/utils/sharedprefs.dart';
import 'package:shabab/utils/tafsil_data.dart';
import 'package:shabab/widgets/item_juz.dart';
import 'package:shabab/widgets/item_sura.dart';
import 'package:shabab/widgets/item_tafsil.dart';

class ContentPage extends StatelessWidget {
  ContentPage({Key? key}) : super(key: key);
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'الأجزاء'),
    const Tab(text: 'السور'),
    const Tab(text: 'التفصيل'),
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return DefaultTabController(
      length: myTabs.length,
      initialIndex: sharedPrefs.lastTab,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade700,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.black38,
            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.light, // For Android (dark icons)
            statusBarBrightness: Brightness.dark, // For iOS (dark icons)
          ),
          toolbarHeight: 30,
          backgroundColor: Colors.blueGrey.shade900,
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            overlayColor: MaterialStateProperty.all(Colors.grey),
            tabs: myTabs,
            onTap: (index) => sharedPrefs.lastTab = index,
          ),
          title: const Text('الفهرس',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              )),
          centerTitle: true,
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              JuzTab(),
              SuraTab(),
              TafsilTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class JuzTab extends StatelessWidget {
  const JuzTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        //          <-- ListTile.divideTiles
        color: Colors.white24,
        context: context,
        tiles: List.generate(
          juzAndIndex.length,
          (index) => JuzItem(juzAndIndexMap: juzAndIndex[index]),
        ),
      ).toList(),
    );
  }
}

class SuraTab extends StatelessWidget {
  const SuraTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        //          <-- ListTile.divideTiles
        color: Colors.white24,
        context: context,
        tiles: List.generate(
          suraList.length,
          (index) => SuraItem(sura: suraList[index]),
        ),
      ).toList(),
    );
  }
}

class TafsilTab extends StatelessWidget {
  const TafsilTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(
        //          <-- ListTile.divideTiles
        color: Colors.white24,
        context: context,
        tiles: List.generate(
          tafsilList.length,
          (index) => TafsilItem(tafsil: tafsilList[index]),
        ),
      ).toList(),
    );
  }
}
