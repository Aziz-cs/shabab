class Tafsil {
  String title;
  String suraName;
  bool isSuraTitle;
  int pageNo;

  Tafsil({
    required this.title,
    this.suraName = '',
    this.isSuraTitle = false,
    required this.pageNo,
  });
}
