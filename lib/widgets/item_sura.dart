import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shabab/pages/quran_page.dart';
import 'package:shabab/utils/helper.dart';

import '../model/sura.dart';
import '../utils/sharedprefs.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({
    Key? key,
    required this.sura,
  }) : super(key: key);

  final Sura sura;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        tileColor: Colors.blueGrey.shade700,
        leading: Padding(
          padding: const EdgeInsets.only(right: 13),
          child: sura.isRef
              ? const Icon(
                  Icons.bookmark,
                  color: Colors.white70,
                )
              : Text(
                  sura.order.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
        title: Text(
          sura.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: sura.isRef
            ? const SizedBox()
            : Text(
                getSuraDetails(sura),
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
              sura.pageNo.toString(),
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
          sharedPrefs.lastPage = sura.pageNo;
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

getSuraDetails(Sura sura) {
  String suraType = sura.isMakka ? 'مكية' : 'مدينة';
  String suraVerseNumbers = sura.verseNumbers.toString() + ' ' + 'آية';
  return suraType + ' - ' + suraVerseNumbers;
}
