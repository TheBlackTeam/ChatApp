class Message {
  String content;
  String date;
  String from;
  String fromUid;
  bool isRead;
  List<String> starredUids = [];

  Message(
      {this.date,
      this.from,
      this.fromUid,
      this.isRead,
      this.starredUids,
      this.content});
}
