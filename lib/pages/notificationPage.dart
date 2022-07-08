import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/models/Notification.dart';
import 'package:test2/data/notifications_collection.dart';
import 'package:test2/widgets/notificationWidget.dart';
import 'package:test2/widgets/requestWidget.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationsController _notifications =
      Get.put(NotificationsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Notifications',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        Expanded(
            child: Obx(
          () => _notifications.collections.isEmpty
              ? const Center(
                  child: Text('No more notification'),
                )
              : Obx(
                  () => ListView.builder(
                    itemCount: _notifications.collections.length,
                    itemBuilder: (BuildContext context, int i) {
                      return NotificationWidget(
                        content: _notifications.collections[i].content,
                        time: _notifications.collections[i].time,
                        id: _notifications.collections[i].id,
                      );
                    },
                  ),
                ),
        ))
      ],
    ));
  }
}
