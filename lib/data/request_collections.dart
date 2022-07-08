import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:test2/models/user.dart';

class RequestModel {
  User user;
  String time, id;

  RequestModel({
    required this.user,
    required this.time,
    required this.id,
  });
}

class RequestsColletionsController extends GetxController {
  final RxList<RequestModel> _collections = [
    RequestModel(
      user: User(
        lastName: 'User',
        firstName: '5',
        bio: 'bio',
        id: '5',
        avatarFileName: 'url',
        email: 'mail',
      ),
      time: '22 jan 2022',
      id: 'request 1',
    ),
    RequestModel(
      user: User(
        lastName: 'User',
        firstName: '6',
        bio: 'bio',
        id: '6',
        avatarFileName: 'url',
        email: 'mail',
      ),
      time: '22 jan 2022',
      id: 'request 2',
    ),
  ].obs;

  List<RequestModel> get collections {
    return [..._collections];
  }

  void declineRequest(String userId) {
    int index = _collections.indexWhere((element) => element.id == userId);
    _collections.removeAt(index);
    _collections.refresh();
  }

  void acceptRequest(String userId) {
    int index = _collections.indexWhere((element) => element.id == userId);
    _collections.removeAt(index);
    _collections.refresh();
  }
}
