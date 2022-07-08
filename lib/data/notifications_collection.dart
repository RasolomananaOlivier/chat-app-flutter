import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import 'package:get/get.dart';
import 'package:test2/models/Notification.dart';

class NotificationsController extends GetxController {
  final RxList<NotificationModel> _collections = [
    NotificationModel(
      content: 'Some very long text about notification 1',
      time: 'time',
      id: 'notificaton 1',
    ),
    NotificationModel(
      content: 'Some very long text about notification 2',
      time: 'time',
      id: 'notificaton 2',
    ),
    NotificationModel(
      content: 'Some very long text about notification 3',
      time: 'time',
      id: 'notificaton 3',
    ),
  ].obs;

  List<NotificationModel> get collections {
    return [..._collections];
  }

  void remove(String id) {
    int i = _collections.indexWhere((element) => element.id == id);
    _collections.removeAt(i);
  }
}
