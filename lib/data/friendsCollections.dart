import 'package:get/get.dart';
import 'package:test2/models/user.dart';

class FriendsCollectionsController extends GetxController {
  RxList<User> friendsCollections = [
    User(
      lastName: 'User',
      firstName: '2',
      bio: 'bio',
      id: '2',
      avatarFileName: 'url',
      email: 'mail',
    ),
    User(
      lastName: 'User',
      firstName: '3',
      bio: 'bio',
      id: '3',
      avatarFileName: 'url',
      email: 'mail',
    ),
    User(
      lastName: 'User',
      firstName: '4',
      bio: 'bio',
      id: '4',
      avatarFileName: 'url',
      email: 'mail',
    )
  ].obs;

  List<User> get friendsList {
    return [...friendsCollections];
  }

  void addNewUser() {
    friendsCollections.add(User(
      lastName: 'User',
      firstName: 'sdf',
      bio: 'bio',
      id: '',
      avatarFileName: 'url',
      email: 'mail',
    ));
  }

  void updateAll(List<User> list) {
    friendsCollections = list.obs;
  }
}
