import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shabab/pages/content_page.dart';
import 'package:wakelock/wakelock.dart';

import '../utils/content_data.dart';
import '../utils/helper.dart';
import '../utils/sharedprefs.dart';

class QuranPage extends StatefulWidget {
  QuranPage({
    Key? key,
    this.isBookmarkVisible = false,
  }) : super(key: key);
  bool isBookmarkVisible;

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  late bool isPortrait;

  bool _isBarsVisible = false;
  final pageController = PageController(
    initialPage: sharedPrefs.lastPage,
  );

  final _pageNoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('isDarkMode? ${sharedPrefs.isDarkMode}');
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
          sharedPrefs.isDarkMode ? Colors.black : Colors.white,
    ));
    Wakelock.enable();
    final pageView = _buildQuranPageView();
    return Scaffold(
      backgroundColor: sharedPrefs.isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: GestureDetector(
            onTap: () => setState(() {
              _isBarsVisible = !_isBarsVisible;
            }),
            child: Stack(
              children: [
                pageView,
                _buildTopDetailsBar(),
                Visibility(
                  visible: widget.isBookmarkVisible,
                  child: Positioned(
                      top: 0,
                      left: 5,
                      child: Image.asset(
                        'assets/images/bookmark_ic.png',
                        width: 25,
                        color: Colors.blueGrey.withOpacity(0.7),
                      )),
                ),
                Visibility(
                  visible: _isBarsVisible,
                  child: Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.blueGrey.shade900.withOpacity(0.8),
                      // color: Colors.black.withOpacity(0.75),
                      child: Column(
                        children: [
                          _buildFirstOptionRow(context),
                          const Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                            height: 0,
                          ),
                          _buildSecondOptionRow(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PageView _buildQuranPageView() {
    return PageView(
      onPageChanged: (currentPage) {
        print('currentpage: ${sharedPrefs.lastPage}');
        print('bookmarkpage: ${sharedPrefs.markedPage}');
        if (_isBarsVisible) {
          setState(() {
            sharedPrefs.lastPage = currentPage;
          });
        } else {
          sharedPrefs.lastPage = currentPage;
        }
        if (isCurrentPageIsTheMarkedPage()) {
          print('in isCurrentPageIsTheMarkedPage');
          setState(() {
            widget.isBookmarkVisible = true;
          });
        } else if (!isCurrentPageIsTheMarkedPage() &&
            widget.isBookmarkVisible) {
          print('in not isCurrentPageIsTheMarkedPage block');
          setState(() {
            widget.isBookmarkVisible = false;
          });
        }
        getToastMessage(currentPage: currentPage + 1);
      },
      controller: pageController,

      // reverse: true,
      allowImplicitScrolling: true,
      children: List.generate(
        604,
        (index) => sharedPrefs.isDarkMode
            ? ColorFiltered(
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.difference),
                child: _buildQuranPage(index),
              )
            : _buildQuranPage(index),
      ),
    );
  }

  Widget _buildQuranPage(int index) {
    return isPortrait
        ? Image.asset(
            'assets/quran_pages/${index + 1}.png',
            fit: sharedPrefs.isFullscreen ? BoxFit.fill : BoxFit.contain,
          )
        : PhotoView(
            imageProvider: AssetImage(
              "assets/quran_pages/${index + 1}.png",
            ),
            backgroundDecoration: BoxDecoration(
              color: sharedPrefs.isDarkMode ? Colors.black : Colors.white,
            ),
            initialScale: PhotoViewComputedScale.covered,
            maxScale: PhotoViewComputedScale.covered,
            basePosition: Alignment.topCenter,
          );
  }

  TextField _buildTextField() {
    return TextField(
      controller: _pageNoTextController,
      cursorColor: Colors.black,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
      ),
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'اكتب رقم الصفة هنا',
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        isDense: true,
        hintStyle: TextStyle(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        focusColor: Colors.black,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
    );
  }

  Widget _buildTopDetailsBar() {
    return Visibility(
      visible: _isBarsVisible,
      child: Positioned(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          color: Colors.blueGrey.shade900.withOpacity(0.8),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  getJuzName(sharedPrefs.lastPage + 1),
                  textAlign: TextAlign.right,
                  style: kTxtStyleWhite,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '${sharedPrefs.lastPage + 1}',
                  textAlign: TextAlign.center,
                  style: kTxtStyleWhite,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'سورة ${getSuraName(sharedPrefs.lastPage + 1)}',
                  textAlign: TextAlign.left,
                  style: kTxtStyleWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstOptionRow(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: TextButton.icon(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    height: 1.2,
                    fontFamily: 'Din',
                  ),
                ),
              ),
              icon: const Icon(
                CupertinoIcons.square_list_fill,
                color: Colors.white,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContentPage(),
                ),
              ),
              label: Text(
                'الفهرس',
                textAlign: TextAlign.center,
                style: kTxtStyleWhite,
              ),
            ),
          ),
          VerticalDivider(color: Colors.grey.shade400),
          Expanded(
            child: TextButton.icon(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    height: 1.2,
                    fontFamily: 'Din',
                  ),
                ),
              ),
              icon: const Icon(
                CupertinoIcons.bookmark_solid,
                color: Colors.white,
                size: 21,
              ),
              onPressed: () {
                sharedPrefs.markedPage = sharedPrefs.lastPage + 1;
                setState(() {
                  _isBarsVisible = false;
                  widget.isBookmarkVisible = true;
                });
                showToast('تم حفظ العلامة');
              },
              label: Text(
                'حفظ علامة',
                textAlign: TextAlign.center,
                style: kTxtStyleWhite,
              ),
            ),
          ),
          VerticalDivider(color: Colors.grey.shade400),
          Expanded(
            child: TextButton.icon(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    height: 1.2,
                    fontFamily: 'Din',
                  ),
                ),
              ),
              icon: const Icon(
                Icons.bookmark_added_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                sharedPrefs.lastPage = sharedPrefs.markedPage - 1;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuranPage(isBookmarkVisible: true),
                  ),
                );
              },
              label: Text(
                'العلامة',
                textAlign: TextAlign.center,
                style: kTxtStyleWhite,
              ),
            ),
          ),
          VerticalDivider(color: Colors.grey.shade400),
          IconButton(
            onPressed: () async {
              final InAppReview inAppReview = InAppReview.instance;
              inAppReview.openStoreListing(appStoreId: '1641840559');
            },
            icon: const Icon(
              CupertinoIcons.star_fill,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondOptionRow(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: TextButton.icon(
              icon: const Icon(
                CupertinoIcons.paperplane_fill,
                color: Colors.white,
              ),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    height: 1.2,
                    fontFamily: 'Din',
                  ),
                ),
              ),
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      alignment: Alignment.center,
                      actionsAlignment: MainAxisAlignment.center,
                      title: const Center(
                        child: Text(
                          "الذهاب إلى صفحة",
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                      content: _buildTextField(),
                      actions: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.blueGrey.shade700),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            if (_pageNoTextController.text.trim().isEmpty) {
                              return;
                            }
                            if (int.parse(_pageNoTextController.text.trim()) <
                                    1 ||
                                int.parse(_pageNoTextController.text.trim()) >
                                    604) {
                              showToast('برجاء إدخال رقم صفحة صحيح');
                              return;
                            }

                            pageController.jumpToPage(
                              int.parse(_pageNoTextController.text.trim()) - 1,
                            );
                            _pageNoTextController.text = '';
                          },
                          child: const Text(
                            'الذهاب',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
              label: Text(
                isPortrait ? 'انتقال' : 'انتقال سريع',
                textAlign: TextAlign.center,
                style: kTxtStyleWhite,
              ),
            ),
          ),
          VerticalDivider(color: Colors.grey.shade400),
          isPortrait
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      sharedPrefs.isDarkMode = !sharedPrefs.isDarkMode;
                    });
                  },
                  icon: Icon(
                    sharedPrefs.isDarkMode
                        ? CupertinoIcons.sun_max_fill
                        : CupertinoIcons.moon_fill,
                    color: Colors.white,
                  ),
                )
              : Expanded(
                  child: TextButton.icon(
                    icon: Icon(
                      sharedPrefs.isDarkMode
                          ? CupertinoIcons.sun_max_fill
                          : CupertinoIcons.moon_fill,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(
                          height: 1.2,
                          fontFamily: 'Din',
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        sharedPrefs.isDarkMode = !sharedPrefs.isDarkMode;
                      });
                    },
                    label: Text(
                      sharedPrefs.isDarkMode ? 'قراءة صباحية' : 'قراءة ليلية',
                      textAlign: TextAlign.center,
                      style: kTxtStyleWhite,
                    ),
                  ),
                ),
          // VerticalDivider(color: Colors.grey.shade400),

          VerticalDivider(color: Colors.grey.shade400),
          isPortrait
              ? IconButton(
                  onPressed: () async {
                    await SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeRight,
                      DeviceOrientation.landscapeLeft,
                    ]);
                  },
                  icon: const Icon(
                    CupertinoIcons.device_phone_landscape,
                    color: Colors.white,
                  ),
                )
              : Expanded(
                  child: TextButton.icon(
                    icon: const Icon(
                      CupertinoIcons.device_phone_portrait,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        const TextStyle(
                          height: 1.2,
                          fontFamily: 'Din',
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                      ]);
                    },
                    label: Text(
                      'وضع أفقي',
                      textAlign: TextAlign.center,
                      style: kTxtStyleWhite,
                    ),
                  ),
                ),
          VerticalDivider(color: Colors.grey.shade400),
          Visibility(
            visible: isPortrait,
            child: Expanded(
              child: TextButton.icon(
                style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(
                      height: 1.2,
                      fontFamily: 'Din',
                    ),
                  ),
                ),
                icon: const Icon(
                  CupertinoIcons.textformat_size,
                  color: Colors.white,
                ),
                onPressed: () => setState(() {
                  sharedPrefs.isFullscreen = !sharedPrefs.isFullscreen;
                }),
                label: Text(
                  'الخط',
                  textAlign: TextAlign.center,
                  style: kTxtStyleWhite,
                ),
              ),
            ),
          ),
          VerticalDivider(color: Colors.grey.shade400),
          IconButton(
            onPressed: () {
              String sharedContent = '''
- تفسير القرآن للشباب | د.فاتن الفلكي
جوجل بلاي:
https://play.google.com/store/apps/details?id=com.tafsir.shabab
آب ستور:
https://apps.apple.com/eg/app/id1641840559
''';
              //  '''
              // - تطبيق "تلاوة | القرآن الكريم"\nإقرأ وردك الآن بجودة عالية مع إمكان القراءة الليلية وتعديل حجم الخط بدون إعلانات ولا نت.\nأندرويد:\nhttps://play.google.com/store/apps/details?id=com.tafsir.shabab\nأيفون:\nhttps://apps.apple.com/eg/app/id''';
              Share.share(sharedContent);
            },
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
