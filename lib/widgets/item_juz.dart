import 'package:flutter/material.dart';
import 'package:shabab/pages/quran_page.dart';
import 'package:shabab/utils/content_data.dart';
import 'package:shabab/utils/helper.dart';

import '../utils/sharedprefs.dart';

const juzTxtStyle = TextStyle(
  color: Colors.white70,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

class JuzItem extends StatelessWidget {
  const JuzItem({
    Key? key,
    required this.juzAndIndexMap,
  }) : super(key: key);

  final Map<dynamic, int> juzAndIndexMap;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        tileColor: Colors.blueGrey.shade700,
        leading: const Icon(
          Icons.bookmark,
          color: Colors.white70,
        ),
        title: isRefItem(juzAndIndexMap.values.first)
            ? Text(
                '${juzAndIndexMap.keys.first}',
                style: juzTxtStyle,
              )
            : Text(
                'الجزء ${juzAndIndexMap.keys.first}',
                style: juzTxtStyle,
              ),
        trailing: const Icon(
          Icons.arrow_right_outlined,
          color: Colors.white70,
        ),
        onTap: () {
          sharedPrefs.lastPage = juzAndIndexMap.values.first;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => QuranPage(
                    isBookmarkVisible: isCurrentPageIsTheMarkedPage()),
              ),
              (route) => false);
          if (isRefItem(juzAndIndexMap.values.first) == false) {
            showToast('جزء ${juzAndIndexMap.keys.first}');
          }
        },
      ),
    );
  }

  bool isRefItem(int pageNo) {
    return pageNo == 605 || pageNo == 606 || pageNo == 607;
  }
}
