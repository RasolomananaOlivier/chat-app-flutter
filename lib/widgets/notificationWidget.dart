import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/data/notifications_collection.dart';

class NotificationWidget extends StatefulWidget {
  String content, time, id;

  NotificationWidget({
    Key? key,
    required this.content,
    required this.time,
    required this.id,
  }) : super(key: key);

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  final NotificationsController _notifications =
      Get.find<NotificationsController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 5, right: 8),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.amber,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.content,
                ),
                Text(widget.time),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              _notifications.remove(widget.id);
            },
            color: Colors.red,
            icon: const Icon(Icons.cancel),
          ),
        ],
      ),
    );
  }
}
