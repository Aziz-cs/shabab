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
        tileColor: tafsil.isSuraTitle
            ? Colors.blueGrey.shade800
            : Colors.blueGrey.shade700,
        // leading: const Padding(
        //   padding: EdgeInsets.only(right: 4),
        //   child: Text(
        //     '-',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 18,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ),
        title: Text(
          tafsil.title,
          textAlign: tafsil.isSuraTitle ? TextAlign.center : TextAlign.right,
          style: TextStyle(
            color: tafsil.isSuraTitle ? Colors.amber.shade50 : Colors.white,
            fontSize: tafsil.isSuraTitle ? 21 : 18,
            fontWeight:
                // tafsil.isSuraTitle ? FontWeight.bold :
                FontWeight.w500,
          ),
        ),
        // subtitle: tafsil.isSuraTitle
        //     ? const SizedBox()
        //     : Text(
        //         tafsil.suraName,
        //         style: const TextStyle(
        //           color: Colors.white70,
        //           fontSize: 15,
        //         ),
        //       ),
        trailing: SizedBox(
          width: 45,
          child: Column(
            children: [
              Text(
                tafsil.suraName.isEmpty ? 'صفحة' : tafsil.suraName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:
                      tafsil.isSuraTitle ? Colors.amber.shade50 : Colors.white,
                  fontSize: 11,
                  overflow: TextOverflow.fade,
                ),
              ),
              Flexible(
                child: Text(
                  tafsil.pageNo.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: tafsil.isSuraTitle
                        ? Colors.amber.shade50
                        : Colors.white,
                    fontSize: 16,
                    // fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // const Text(
              //   'صــ',
              //   style: TextStyle(
              //     color: Colors.white, fontSize: 14,
              //     height: 0.5,
              //     // fontWeight: FontWeight.w500,
              //   ),
              // ),
            ],
          ),
        ),
        onTap: () {
          sharedPrefs.lastPage = tafsil.pageNo;
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
