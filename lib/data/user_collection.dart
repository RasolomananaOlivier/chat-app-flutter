import 'package:get/get.dart';
import 'package:test2/models/user.dart';

class InfoController extends GetxController {
  RxString val = 'hey'.obs;
  final user = User(
          id: 'id',
          avatarFileName: 'avatarFileName',
          email: 'email',
          firstName: 'firstName',
          lastName: 'lastName',
          bio: 'bio')
      .obs;

  String get name {
    return user.value.name;
  }

  void updateData(
      {required String lastName,
      required String firstName,
      required String email,
      required String bio}) {
    user.update((user) {
      user?.email = email;
      user?.lastName = lastName;
      user?.firstName = firstName;
      user?.bio = bio;
    });
  }
}
