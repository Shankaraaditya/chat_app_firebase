class ChatRoomModel {
  String? chatroomid;
  List<String>? participants;

  ChatRoomModel({this.chatroomid, this.participants});

  ChatRoomModel.frommap(Map<String, dynamic> map) {
    chatroomid = map["chatroomid"];
    participants = map["participants"];
  }

  Map<String, dynamic> tomap() {
    return {"chatroomid": chatroomid, "participants": participants};
  }
}
