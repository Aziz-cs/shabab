import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shabab/utils/sharedprefs.dart';

var kTxtStyleWhite = const TextStyle(
  color: Colors.white, fontSize: 15.5,
  // height: 0.5,
);

final Color kDefaultAppColor = Colors.blueGrey.shade900;

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    fontSize: 16.0,
  );
}

bool isCurrentPageIsTheMarkedPage() =>
    sharedPrefs.markedPage == sharedPrefs.lastPage;

String getHezbSubNumberName(int hezbSubNumber) {
  switch (hezbSubNumber) {
    case 1:
      return 'ربع';
    case 2:
      return 'نصف';
    case 3:
      return 'ثلاثة أرباع';
    case 0:
      return '';
    default:
      return '';
  }
}

void showToastOfHezb({required int hezbNumber, int hezbSubNumber = 0}) {
  String hezbMsg = '${getHezbSubNumberName(hezbSubNumber)} حزب $hezbNumber';
  showToast(hezbMsg);
}

void getToastMessage({required int currentPage}) {
  switch (currentPage) {
    case 5:
      showToastOfHezb(hezbNumber: 1, hezbSubNumber: 1);
      break;
    case 7:
      showToastOfHezb(hezbNumber: 1, hezbSubNumber: 2);
      break;
    case 9:
      showToastOfHezb(hezbNumber: 1, hezbSubNumber: 3);
      break;
    case 11:
      showToastOfHezb(hezbNumber: 2);
      break;
    case 14:
      showToastOfHezb(hezbNumber: 2, hezbSubNumber: 1);
      break;
    case 17:
      showToastOfHezb(hezbNumber: 2, hezbSubNumber: 2);
      break;
    case 19:
      showToastOfHezb(hezbNumber: 2, hezbSubNumber: 3);
      break;
    case 22:
      showToast("جزء 2");
      break;
    case 24:
      showToastOfHezb(hezbNumber: 3, hezbSubNumber: 1);
      break;
    case 27:
      showToastOfHezb(hezbNumber: 3, hezbSubNumber: 2);
      break;
    case 29:
      showToastOfHezb(hezbNumber: 3, hezbSubNumber: 3);
      break;
    case 32:
      showToastOfHezb(hezbNumber: 4);
      break;
    case 34:
      showToastOfHezb(hezbNumber: 4, hezbSubNumber: 1);
      break;
    case 37:
      showToastOfHezb(hezbNumber: 4, hezbSubNumber: 2);
      break;
    case 39:
      showToastOfHezb(hezbNumber: 4, hezbSubNumber: 3);
      break;
    case 42:
      showToast("جزء 3");
      break;
    case 44:
      showToastOfHezb(hezbNumber: 5, hezbSubNumber: 1);
      break;
    case 46:
      showToastOfHezb(hezbNumber: 5, hezbSubNumber: 2);
      break;
    case 49:
      showToastOfHezb(hezbNumber: 5, hezbSubNumber: 3);
      break;
    case 51:
      showToastOfHezb(hezbNumber: 6);
      break;
    case 54:
      showToastOfHezb(hezbNumber: 6, hezbSubNumber: 1);
      break;
    case 56:
      showToastOfHezb(hezbNumber: 6, hezbSubNumber: 2);
      break;
    case 59:
      showToastOfHezb(hezbNumber: 6, hezbSubNumber: 3);
      break;
    case 62:
      showToast("جزء 4");
      break;
    case 64:
      showToastOfHezb(hezbNumber: 7, hezbSubNumber: 1);
      break;
    case 67:
      showToastOfHezb(hezbNumber: 7, hezbSubNumber: 2);
      break;
    case 69:
      showToastOfHezb(hezbNumber: 7, hezbSubNumber: 3);
      break;
    case 72:
      showToastOfHezb(hezbNumber: 8);
      break;
    case 74:
      showToastOfHezb(hezbNumber: 8, hezbSubNumber: 1);
      break;
    case 77:
      showToastOfHezb(hezbNumber: 8, hezbSubNumber: 2);
      break;
    case 79:
      showToastOfHezb(hezbNumber: 8, hezbSubNumber: 3);
      break;
    case 82:
      showToast("جزء 5");
      break;
    case 84:
      showToastOfHezb(hezbNumber: 9, hezbSubNumber: 1);
      break;
    case 87:
      showToastOfHezb(hezbNumber: 9, hezbSubNumber: 2);
      break;
    case 89:
      showToastOfHezb(hezbNumber: 9, hezbSubNumber: 3);
      break;
    case 92:
      showToastOfHezb(hezbNumber: 10);
      break;
    case 94:
      showToastOfHezb(hezbNumber: 10, hezbSubNumber: 1);
      break;
    case 97:
      showToastOfHezb(hezbNumber: 10, hezbSubNumber: 2);
      break;
    case 100:
      showToastOfHezb(hezbNumber: 10, hezbSubNumber: 3);
      break;
    case 102:
      showToast("جزء 6");
      break;
    case 104:
      showToastOfHezb(hezbNumber: 11, hezbSubNumber: 1);
      break;
    case 106:
      showToastOfHezb(hezbNumber: 11, hezbSubNumber: 2);
      break;
    case 109:
      showToastOfHezb(hezbNumber: 11, hezbSubNumber: 3);
      break;
    case 112:
      showToastOfHezb(hezbNumber: 12);
      break;
    case 114:
      showToastOfHezb(hezbNumber: 12, hezbSubNumber: 1);
      break;
    case 117:
      showToastOfHezb(hezbNumber: 12, hezbSubNumber: 2);
      break;
    case 119:
      showToastOfHezb(hezbNumber: 12, hezbSubNumber: 3);
      break;
    case 121:
      showToast("جزء 7");
      break;
    case 124:
      showToastOfHezb(hezbNumber: 13, hezbSubNumber: 1);
      break;
    case 126:
      showToastOfHezb(hezbNumber: 13, hezbSubNumber: 2);
      break;
    case 129:
      showToastOfHezb(hezbNumber: 13, hezbSubNumber: 3);
      break;
    case 132:
      showToastOfHezb(hezbNumber: 14);
      break;
    case 134:
      showToastOfHezb(hezbNumber: 14, hezbSubNumber: 1);
      break;
    case 137:
      showToastOfHezb(hezbNumber: 14, hezbSubNumber: 2);
      break;
    case 140:
      showToastOfHezb(hezbNumber: 14, hezbSubNumber: 3);
      break;
    case 142:
      showToast("جزء 8");
      break;
    case 144:
      showToastOfHezb(hezbNumber: 15, hezbSubNumber: 1);
      break;
    case 146:
      showToastOfHezb(hezbNumber: 15, hezbSubNumber: 2);
      break;
    case 148:
      showToastOfHezb(hezbNumber: 15, hezbSubNumber: 3);
      break;
    case 151:
      showToastOfHezb(hezbNumber: 16);
      break;
    case 154:
      showToastOfHezb(hezbNumber: 16, hezbSubNumber: 1);
      break;
    case 156:
      showToastOfHezb(hezbNumber: 16, hezbSubNumber: 2);
      break;
    case 158:
      showToastOfHezb(hezbNumber: 16, hezbSubNumber: 3);
      break;
    case 162:
      showToast("جزء 9");
      break;
    case 164:
      showToastOfHezb(hezbNumber: 17, hezbSubNumber: 1);
      break;
    case 167:
      showToastOfHezb(hezbNumber: 17, hezbSubNumber: 2);
      break;
    case 170:
      showToastOfHezb(hezbNumber: 17, hezbSubNumber: 3);
      break;
    case 173:
      showToastOfHezb(hezbNumber: 18);
      break;
    case 175:
      showToastOfHezb(hezbNumber: 18, hezbSubNumber: 1);
      break;
    case 177:
      showToastOfHezb(hezbNumber: 18, hezbSubNumber: 2);
      break;
    case 179:
      showToastOfHezb(hezbNumber: 18, hezbSubNumber: 3);
      break;
    case 182:
      showToast("جزء 10");
      break;
    case 184:
      showToastOfHezb(hezbNumber: 19, hezbSubNumber: 1);
      break;
    case 187:
      showToastOfHezb(hezbNumber: 19, hezbSubNumber: 2);
      break;
    case 189:
      showToastOfHezb(hezbNumber: 19, hezbSubNumber: 3);
      break;
    case 192:
      showToastOfHezb(hezbNumber: 20);
      break;
    case 194:
      showToastOfHezb(hezbNumber: 20, hezbSubNumber: 1);
      break;
    case 196:
      showToastOfHezb(hezbNumber: 20, hezbSubNumber: 2);
      break;
    case 199:
      showToastOfHezb(hezbNumber: 20, hezbSubNumber: 3);
      break;
    case 201:
      showToast("جزء 11");
      break;
    case 204:
      showToastOfHezb(hezbNumber: 21, hezbSubNumber: 1);
      break;
    case 206:
      showToastOfHezb(hezbNumber: 21, hezbSubNumber: 2);
      break;
    case 209:
      showToastOfHezb(hezbNumber: 21, hezbSubNumber: 3);
      break;
    case 212:
      showToastOfHezb(hezbNumber: 22);
      break;
    case 214:
      showToastOfHezb(hezbNumber: 22, hezbSubNumber: 1);
      break;
    case 217:
      showToastOfHezb(hezbNumber: 22, hezbSubNumber: 2);
      break;
    case 219:
      showToastOfHezb(hezbNumber: 22, hezbSubNumber: 3);
      break;
    case 222:
      showToast("جزء 12");
      break;
    case 224:
      showToastOfHezb(hezbNumber: 23, hezbSubNumber: 1);
      break;
    case 226:
      showToastOfHezb(hezbNumber: 23, hezbSubNumber: 2);
      break;
    case 228:
      showToastOfHezb(hezbNumber: 23, hezbSubNumber: 3);
      break;
    case 231:
      showToastOfHezb(hezbNumber: 24);
      break;
    case 233:
      showToastOfHezb(hezbNumber: 24, hezbSubNumber: 1);
      break;
    case 236:
      showToastOfHezb(hezbNumber: 24, hezbSubNumber: 2);
      break;
    case 238:
      showToastOfHezb(hezbNumber: 24, hezbSubNumber: 3);
      break;
    case 243:
      showToast("جزء 13");
      break;
    case 244:
      showToastOfHezb(hezbNumber: 25, hezbSubNumber: 1);
      break;
    case 247:
      showToastOfHezb(hezbNumber: 25, hezbSubNumber: 2);
      break;
    case 249:
      showToastOfHezb(hezbNumber: 25, hezbSubNumber: 3);
      break;
    case 252:
      showToastOfHezb(hezbNumber: 26);
      break;
    case 254:
      showToastOfHezb(hezbNumber: 26, hezbSubNumber: 1);
      break;
    case 256:
      showToastOfHezb(hezbNumber: 26, hezbSubNumber: 2);
      break;
    case 259:
      showToastOfHezb(hezbNumber: 26, hezbSubNumber: 3);
      break;
    case 262:
      showToast("جزء 14");
      break;
    case 264:
      showToastOfHezb(hezbNumber: 27, hezbSubNumber: 1);
      break;
    case 267:
      showToastOfHezb(hezbNumber: 27, hezbSubNumber: 2);
      break;
    case 270:
      showToastOfHezb(hezbNumber: 27, hezbSubNumber: 3);
      break;
    case 272:
      showToastOfHezb(hezbNumber: 28);
      break;
    case 275:
      showToastOfHezb(hezbNumber: 28, hezbSubNumber: 1);
      break;
    case 277:
      showToastOfHezb(hezbNumber: 28, hezbSubNumber: 2);
      break;
    case 280:
      showToastOfHezb(hezbNumber: 28, hezbSubNumber: 3);
      break;
    case 282:
      showToast("جزء 15");
      break;
    case 284:
      showToastOfHezb(hezbNumber: 29, hezbSubNumber: 1);
      break;
    case 287:
      showToastOfHezb(hezbNumber: 29, hezbSubNumber: 2);
      break;
    case 289:
      showToastOfHezb(hezbNumber: 29, hezbSubNumber: 3);
      break;
    case 292:
      showToastOfHezb(hezbNumber: 30);
      break;
    case 295:
      showToastOfHezb(hezbNumber: 30, hezbSubNumber: 1);
      break;
    case 297:
      showToastOfHezb(hezbNumber: 30, hezbSubNumber: 2);
      break;
    case 299:
      showToastOfHezb(hezbNumber: 30, hezbSubNumber: 3);
      break;
    case 302:
      showToast("جزء 16");
      break;
    case 304:
      showToastOfHezb(hezbNumber: 31, hezbSubNumber: 1);
      break;
    case 306:
      showToastOfHezb(hezbNumber: 31, hezbSubNumber: 2);
      break;
    case 309:
      showToastOfHezb(hezbNumber: 31, hezbSubNumber: 3);
      break;
    case 312:
      showToastOfHezb(hezbNumber: 32);
      break;
    case 315:
      showToastOfHezb(hezbNumber: 32, hezbSubNumber: 1);
      break;
    case 317:
      showToastOfHezb(hezbNumber: 32, hezbSubNumber: 2);
      break;
    case 319:
      showToastOfHezb(hezbNumber: 32, hezbSubNumber: 3);
      break;
    case 322:
      showToast("جزء 17");
      break;
    case 324:
      showToastOfHezb(hezbNumber: 33, hezbSubNumber: 1);
      break;
    case 326:
      showToastOfHezb(hezbNumber: 33, hezbSubNumber: 2);
      break;
    case 329:
      showToastOfHezb(hezbNumber: 33, hezbSubNumber: 3);
      break;
    case 332:
      showToastOfHezb(hezbNumber: 34);
      break;
    case 334:
      showToastOfHezb(hezbNumber: 34, hezbSubNumber: 1);
      break;
    case 336:
      showToastOfHezb(hezbNumber: 34, hezbSubNumber: 2);
      break;
    case 339:
      showToastOfHezb(hezbNumber: 34, hezbSubNumber: 3);
      break;
    case 342:
      showToast("جزء 18");
      break;
    case 344:
      showToastOfHezb(hezbNumber: 35, hezbSubNumber: 1);
      break;
    case 347:
      showToastOfHezb(hezbNumber: 35, hezbSubNumber: 2);
      break;
    case 350:
      showToastOfHezb(hezbNumber: 35, hezbSubNumber: 3);
      break;
    case 352:
      showToastOfHezb(hezbNumber: 36);
      break;
    case 354:
      showToastOfHezb(hezbNumber: 36, hezbSubNumber: 1);
      break;
    case 356:
      showToastOfHezb(hezbNumber: 36, hezbSubNumber: 2);
      break;
    case 359:
      showToastOfHezb(hezbNumber: 36, hezbSubNumber: 3);
      break;
    case 362:
      showToast("جزء 19");
      break;
    case 364:
      showToastOfHezb(hezbNumber: 37, hezbSubNumber: 1);
      break;
    case 367:
      showToastOfHezb(hezbNumber: 37, hezbSubNumber: 2);
      break;
    case 369:
      showToastOfHezb(hezbNumber: 37, hezbSubNumber: 3);
      break;
    case 371:
      showToastOfHezb(hezbNumber: 38);
      break;
    case 374:
      showToastOfHezb(hezbNumber: 38, hezbSubNumber: 1);
      break;
    case 377:
      showToastOfHezb(hezbNumber: 38, hezbSubNumber: 2);
      break;
    case 379:
      showToastOfHezb(hezbNumber: 38, hezbSubNumber: 3);
      break;
    case 382:
      showToast("جزء 20");
      break;
    case 384:
      showToastOfHezb(hezbNumber: 39, hezbSubNumber: 1);
      break;
    case 386:
      showToastOfHezb(hezbNumber: 39, hezbSubNumber: 2);
      break;
    case 389:
      showToastOfHezb(hezbNumber: 39, hezbSubNumber: 3);
      break;
    case 392:
      showToastOfHezb(hezbNumber: 40);
      break;
    case 394:
      showToastOfHezb(hezbNumber: 40, hezbSubNumber: 1);
      break;
    case 396:
      showToastOfHezb(hezbNumber: 40, hezbSubNumber: 2);
      break;
    case 399:
      showToastOfHezb(hezbNumber: 40, hezbSubNumber: 3);
      break;
    case 402:
      showToast("جزء 21");
      break;
    case 404:
      showToastOfHezb(hezbNumber: 41, hezbSubNumber: 1);
      break;
    case 407:
      showToastOfHezb(hezbNumber: 41, hezbSubNumber: 2);
      break;
    case 410:
      showToastOfHezb(hezbNumber: 41, hezbSubNumber: 3);
      break;
    case 413:
      showToastOfHezb(hezbNumber: 42);
      break;
    case 415:
      showToastOfHezb(hezbNumber: 42, hezbSubNumber: 1);
      break;
    case 418:
      showToastOfHezb(hezbNumber: 42, hezbSubNumber: 2);
      break;
    case 420:
      showToastOfHezb(hezbNumber: 42, hezbSubNumber: 3);
      break;
    case 422:
      showToast("جزء 22");
      break;
    case 425:
      showToastOfHezb(hezbNumber: 43, hezbSubNumber: 1);
      break;
    case 426:
      showToastOfHezb(hezbNumber: 43, hezbSubNumber: 2);
      break;
    case 429:
      showToastOfHezb(hezbNumber: 43, hezbSubNumber: 3);
      break;
    case 431:
      showToastOfHezb(hezbNumber: 44);
      break;
    case 433:
      showToastOfHezb(hezbNumber: 44, hezbSubNumber: 1);
      break;
    case 436:
      showToastOfHezb(hezbNumber: 44, hezbSubNumber: 2);
      break;
    case 439:
      showToastOfHezb(hezbNumber: 44, hezbSubNumber: 3);
      break;
    case 442:
      showToast("جزء 23");
      break;
    case 444:
      showToastOfHezb(hezbNumber: 45, hezbSubNumber: 1);
      break;
    case 446:
      showToastOfHezb(hezbNumber: 45, hezbSubNumber: 2);
      break;
    case 449:
      showToastOfHezb(hezbNumber: 45, hezbSubNumber: 3);
      break;
    case 451:
      showToastOfHezb(hezbNumber: 46);
      break;
    case 454:
      showToastOfHezb(hezbNumber: 46, hezbSubNumber: 1);
      break;
    case 456:
      showToastOfHezb(hezbNumber: 46, hezbSubNumber: 2);
      break;
    case 459:
      showToastOfHezb(hezbNumber: 46, hezbSubNumber: 3);
      break;
    case 462:
      showToast("جزء 24");
      break;
    case 464:
      showToastOfHezb(hezbNumber: 47, hezbSubNumber: 1);
      break;
    case 467:
      showToastOfHezb(hezbNumber: 47, hezbSubNumber: 2);
      break;
    case 469:
      showToastOfHezb(hezbNumber: 47, hezbSubNumber: 3);
      break;
    case 472:
      showToastOfHezb(hezbNumber: 48);
      break;
    case 474:
      showToastOfHezb(hezbNumber: 48, hezbSubNumber: 1);
      break;
    case 477:
      showToastOfHezb(hezbNumber: 48, hezbSubNumber: 2);
      break;
    case 479:
      showToastOfHezb(hezbNumber: 48, hezbSubNumber: 3);
      break;
    case 482:
      showToast("جزء 25");
      break;
    case 484:
      showToastOfHezb(hezbNumber: 49, hezbSubNumber: 1);
      break;
    case 486:
      showToastOfHezb(hezbNumber: 49, hezbSubNumber: 2);
      break;
    case 488:
      showToastOfHezb(hezbNumber: 49, hezbSubNumber: 3);
      break;
    case 491:
      showToastOfHezb(hezbNumber: 50);
      break;
    case 493:
      showToastOfHezb(hezbNumber: 50, hezbSubNumber: 1);
      break;
    case 496:
      showToastOfHezb(hezbNumber: 50, hezbSubNumber: 2);
      break;
    case 499:
      showToastOfHezb(hezbNumber: 50, hezbSubNumber: 3);
      break;
    case 502:
      showToast("جزء 26");
      break;
    case 505:
      showToastOfHezb(hezbNumber: 51, hezbSubNumber: 1);
      break;
    case 507:
      showToastOfHezb(hezbNumber: 51, hezbSubNumber: 2);
      break;
    case 510:
      showToastOfHezb(hezbNumber: 51, hezbSubNumber: 3);
      break;
    case 513:
      showToastOfHezb(hezbNumber: 52);
      break;
    case 515:
      showToastOfHezb(hezbNumber: 52, hezbSubNumber: 1);
      break;
    case 517:
      showToastOfHezb(hezbNumber: 52, hezbSubNumber: 2);
      break;
    case 519:
      showToastOfHezb(hezbNumber: 52, hezbSubNumber: 3);
      break;
    case 522:
      showToast("جزء 27");
      break;
    case 524:
      showToastOfHezb(hezbNumber: 53, hezbSubNumber: 1);
      break;
    case 526:
      showToastOfHezb(hezbNumber: 53, hezbSubNumber: 2);
      break;
    case 529:
      showToastOfHezb(hezbNumber: 53, hezbSubNumber: 3);
      break;
    case 531:
      showToastOfHezb(hezbNumber: 54);
      break;
    case 534:
      showToastOfHezb(hezbNumber: 54, hezbSubNumber: 1);
      break;
    case 536:
      showToastOfHezb(hezbNumber: 54, hezbSubNumber: 2);
      break;
    case 539:
      showToastOfHezb(hezbNumber: 54, hezbSubNumber: 3);
      break;
    case 542:
      showToast("جزء 28");
      break;
    case 544:
      showToastOfHezb(hezbNumber: 55, hezbSubNumber: 1);
      break;
    case 547:
      showToastOfHezb(hezbNumber: 55, hezbSubNumber: 2);
      break;
    case 550:
      showToastOfHezb(hezbNumber: 55, hezbSubNumber: 3);
      break;
    case 553:
      showToastOfHezb(hezbNumber: 56);
      break;
    case 554:
      showToastOfHezb(hezbNumber: 56, hezbSubNumber: 1);
      break;
    case 558:
      showToastOfHezb(hezbNumber: 56, hezbSubNumber: 2);
      break;
    case 560:
      showToastOfHezb(hezbNumber: 56, hezbSubNumber: 3);
      break;
    case 562:
      showToast("جزء 29");
      break;
    case 564:
      showToastOfHezb(hezbNumber: 57, hezbSubNumber: 1);
      break;
    case 566:
      showToastOfHezb(hezbNumber: 57, hezbSubNumber: 2);
      break;
    case 569:
      showToastOfHezb(hezbNumber: 57, hezbSubNumber: 3);
      break;
    case 572:
      showToastOfHezb(hezbNumber: 58);
      break;
    case 575:
      showToastOfHezb(hezbNumber: 58, hezbSubNumber: 1);
      break;
    case 577:
      showToastOfHezb(hezbNumber: 58, hezbSubNumber: 2);
      break;
    case 579:
      showToastOfHezb(hezbNumber: 58, hezbSubNumber: 3);
      break;
    case 582:
      showToast("جزء 30");
      break;
    case 585:
      showToastOfHezb(hezbNumber: 59, hezbSubNumber: 1);
      break;
    case 587:
      showToastOfHezb(hezbNumber: 59, hezbSubNumber: 2);
      break;
    case 589:
      showToastOfHezb(hezbNumber: 59, hezbSubNumber: 3);
      break;
    case 591:
      showToastOfHezb(hezbNumber: 60);
      break;
    case 594:
      showToastOfHezb(hezbNumber: 60, hezbSubNumber: 1);
      break;
    case 596:
      showToastOfHezb(hezbNumber: 60, hezbSubNumber: 2);
      break;
    case 599:
      showToastOfHezb(hezbNumber: 60, hezbSubNumber: 3);
      break;
    default:
  }
}

String getJuzName(int page) {
  if (page < 22) {
    return 'الجزء الأول';
  } else if (page < 42) {
    return 'الجزء الثاني';
  } else if (page < 62) {
    return 'الجزء الثالث';
  } else if (page < 82) {
    return 'الجزء الرابع';
  } else if (page < 102) {
    return 'الجزء الخامس';
  } else if (page < 121) {
    return 'الجزء السادس';
  } else if (page < 142) {
    return 'الجزء السابع';
  } else if (page < 162) {
    return 'الجزء الثامن';
  } else if (page < 182) {
    return 'الجزء التاسع';
  } else if (page < 201) {
    return 'الجزء العاشر';
  } else if (page < 222) {
    return 'الجزء الحادي عشر';
  } else if (page < 242) {
    return 'الجزء الثاني عشر';
  } else if (page < 262) {
    return 'الجزء الثالث عشر';
  } else if (page < 282) {
    return 'الجزء الرابع عشر';
  } else if (page < 302) {
    return 'الجزء الخامس عشر';
  } else if (page < 322) {
    return 'الجزء السادس عشر';
  } else if (page < 342) {
    return 'الجزء السابع عشر';
  } else if (page < 362) {
    return 'الجزء الثامن عشر';
  } else if (page < 382) {
    return 'الجزء التاسع عشر';
  } else if (page < 402) {
    return 'الجزء العشرون';
  } else if (page < 422) {
    return 'الجزء الحادي والعشرون';
  } else if (page < 442) {
    return 'الجزء الثاني والعشرون';
  } else if (page < 462) {
    return 'الجزء الثالث والعشرون';
  } else if (page < 482) {
    return 'الجزء الرابع والعشرون';
  } else if (page < 502) {
    return 'الجزء الخامس والعشرون';
  } else if (page < 522) {
    return 'الجزء السادس والعشرون';
  } else if (page < 542) {
    return 'الجزء السابع والعشرون';
  } else if (page < 562) {
    return 'الجزء الثامن والعشرون';
  } else if (page < 582) {
    return 'الجزء التاسع والعشرون';
  } else if (page < 605) {
    return 'الجزء الثلاثون';
  } else {
    return '';
  }
}

String getSuraName(int page) {
  if (page < 2) {
    return 'الفاتحة';
  } else if (page < 50) {
    return 'البقرة';
  } else if (page < 77) {
    return 'آل عمران';
  } else if (page < 106) {
    return 'النساء';
  } else if (page < 128) {
    return 'المائدة';
  } else if (page < 151) {
    return 'الأنعام';
  } else if (page < 177) {
    return 'الأعراف';
  } else if (page < 187) {
    return 'الأنفال';
  } else if (page < 208) {
    return 'التوبة';
  } else if (page < 221) {
    return 'يونس';
  } else if (page < 235) {
    return 'هود';
  } else if (page < 249) {
    return 'يوسف';
  } else if (page < 255) {
    return 'الرعد';
  } else if (page < 262) {
    return 'إبراهيم';
  } else if (page < 267) {
    return 'الحجر';
  } else if (page < 282) {
    return 'النحل';
  } else if (page < 293) {
    return 'الإسراء';
  } else if (page < 305) {
    return 'الكهف';
  } else if (page < 312) {
    return 'مريم';
  } else if (page < 322) {
    return 'طه';
  } else if (page < 332) {
    return 'الأنبياء';
  } else if (page < 342) {
    return 'الحج';
  } else if (page < 350) {
    return 'المؤمنون';
  } else if (page < 359) {
    return 'النور';
  } else if (page < 367) {
    return 'الفرقان';
  } else if (page < 377) {
    return 'الشعراء';
  } else if (page < 385) {
    return 'النمل';
  } else if (page < 396) {
    return 'القصص';
  } else if (page < 404) {
    return 'العنكبوت';
  } else if (page < 411) {
    return 'الروم';
  } else if (page < 415) {
    return 'لقمان';
  } else if (page < 418) {
    return 'السجدة';
  } else if (page < 428) {
    return 'الأحزاب';
  } else if (page < 434) {
    return 'سبأ';
  } else if (page < 440) {
    return 'فاطر';
  } else if (page < 446) {
    return 'يس';
  } else if (page < 453) {
    return 'الصآفات';
  } else if (page < 458) {
    return 'ص';
  } else if (page < 467) {
    return 'الزمر';
  } else if (page < 477) {
    return 'غافر';
  } else if (page < 483) {
    return 'فصلت';
  } else if (page < 489) {
    return 'الشورى';
  } else if (page < 496) {
    return 'الزخرف';
  } else if (page < 499) {
    return 'الدخان';
  } else if (page < 502) {
    return 'الجاثية';
  } else if (page < 507) {
    return 'الأحقاف';
  } else if (page < 511) {
    return 'محمّد';
  } else if (page < 515) {
    return 'الفتح';
  } else if (page < 518) {
    return 'الحجرات';
  } else if (page < 520) {
    return 'ق';
  } else if (page < 523) {
    return 'الذاريات';
  } else if (page < 526) {
    return 'الطور';
  } else if (page < 528) {
    return 'النجم';
  } else if (page < 531) {
    return 'القمر';
  } else if (page < 534) {
    return 'الرحمن';
  } else if (page < 537) {
    return 'الواقعة';
  } else if (page < 542) {
    return 'الحديد';
  } else if (page < 545) {
    return 'المجادلة';
  } else if (page < 549) {
    return 'الحشر';
  } else if (page < 551) {
    return 'الممتحنة';
  } else if (page < 553) {
    return 'الصف';
  } else if (page < 554) {
    return 'الجمعة';
  } else if (page < 556) {
    return 'المنافقون';
  } else if (page < 558) {
    return 'التغابن';
  } else if (page < 560) {
    return 'الطلاق';
  } else if (page < 562) {
    return 'التحريم';
  } else if (page < 564) {
    return 'المُلك';
  } else if (page < 566) {
    return 'القلم';
  } else if (page < 568) {
    return 'الحآقّة';
  } else if (page < 570) {
    return 'المعارج';
  } else if (page < 572) {
    return 'نوج';
  } else if (page < 574) {
    return 'الجنّ';
  } else if (page < 575) {
    return 'المُزمّل';
  } else if (page < 577) {
    return 'المُدثر';
  } else if (page < 578) {
    return 'القيامة';
  } else if (page < 580) {
    return 'الإنسان';
  } else if (page < 582) {
    return 'المُرسلات';
  } else if (page < 583) {
    return 'النبأ';
  } else if (page < 585) {
    return 'النازعات';
  } else if (page == 585) {
    return 'عبس';
  } else if (page == 586) {
    return 'التكوير';
  } else if (page == 587) {
    return 'الإنفطار';
  } else if (page == 588) {
    return 'المطففين';
  } else if (page == 589) {
    return 'الإنشقاق';
  } else if (page == 590) {
    return 'البروج';
  } else if (page == 591) {
    return 'الطارق';
  } else if (page == 592) {
    return 'الغاشية';
  } else if (page == 593) {
    return 'الفجر';
  } else if (page == 594) {
    return 'البلد';
  } else if (page == 595) {
    return 'الشمس';
  } else if (page == 596) {
    return 'الضحى';
  } else if (page == 597) {
    return 'التين';
  } else if (page == 598) {
    return 'القدر';
  } else if (page == 599) {
    return 'الزلزلة';
  } else if (page == 600) {
    return 'القارعة';
  } else if (page == 601) {
    return 'العصر';
  } else if (page == 602) {
    return 'قريش';
  } else if (page == 603) {
    return 'الكافرون';
  } else if (page == 604) {
    return 'الإخلاص';
  } else {
    return '';
  }
}
