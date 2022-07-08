import 'package:test2/api/repository.dart';
import 'package:test2/models/user.dart';

class UserController {
  final Repository _repository;
  UserController(this._repository);

  Future<List<User>> fetchAllUser() async {
    return _repository.getAllusers();
  }
}
