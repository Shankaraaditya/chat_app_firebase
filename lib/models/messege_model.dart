class MessegeModel {
  String? sender;
  String? text;
  bool? seen;
  DateTime? createdon;

  MessegeModel({this.sender, this.text, this.seen, this.createdon});

  MessegeModel.frommap(Map<String, dynamic> map) {
    sender = map["sender"];
    text = map["text"];
    seen = map["seen"];
    createdon = ["createdon"] as DateTime;
  }

  Map<String, dynamic> tomap() {
    return {
      "sender": sender,
      "text": text,
      "seen": seen,
      "createdon": createdon
    };
  }
}
