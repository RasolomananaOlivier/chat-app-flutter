import 'package:test2/models/user.dart';

abstract class Repository {
  Future<List<User>> getAllusers();
  Future<User> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String biography,
  });
}
