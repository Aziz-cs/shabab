import 'package:flutter/material.dart';
import 'package:shabab/model/tafsil.dart';
import 'package:shabab/pages/quran_page.dart';
import 'package:shabab/utils/helper.dart';

import '../model/sura.dart';
import '../utils/sharedprefs.dart';

class TafsilItem extends StatelessWidget {
  const TafsilItem({
    Key? key,
    required this.tafsil,
  }) : super(key: key);

  final Tafsil tafsil;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        tileColor: Colors.blueGrey.shade700,
        leading: const Padding(
          padding: EdgeInsets.only(right: 4),
          child: Text(
            '-',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        title: Text(
          tafsil.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          tafsil.suraName,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 15,
          ),
        ),
        trailing: Column(
          children: [
            const Text(
              'صفحة',
              style: TextStyle(
                color: Colors.white, fontSize: 12,
                // fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              tafsil.pageNo.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.1,
                // fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        onTap: () {
          sharedPrefs.lastPage = tafsil.pageNo - 1;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => QuranPage(
                    isBookmarkVisible: isCurrentPageIsTheMarkedPage()),
              ),
              (route) => false);
        },
      ),
    );
  }
}
