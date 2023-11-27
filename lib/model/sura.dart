class Sura {
  String name;
  bool isMakka;
  bool isRef;
  int verseNumbers;
  int pageNo;
  int order;

  Sura({
    required this.name,
    required this.isMakka,
    this.isRef = false,
    required this.verseNumbers,
    required this.pageNo,
    required this.order,
  });
}
