import 'package:flutter/material.dart';

class MessageModel {
  String content, timeStamp, auth, type, id;

  MessageModel({
    required this.auth,
    required this.content,
    required this.timeStamp,
    required this.type,
    required this.id,
  });
}

class MessageCollection {
  String id;
  int more;
  bool loadAll, read;
  List<String> access;
  List<MessageModel> items;

  MessageCollection({
    required this.id,
    required this.access,
    required this.items,
    required this.loadAll,
    required this.more,
    required this.read,
  });
}
