import 'dart:convert';

import 'package:test2/api/repository.dart';
import 'package:test2/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository implements Repository {
  final String url = "http://10.0.2.2:5000/";

  @override
  Future<List<User>> getAllusers() async {
    List<User> list = [];
    Uri uri = Uri.parse(url + 'all-user/626e939424eabf9bede31461');
    http.Response response = await http.get(uri);
    print(response.statusCode);
    var body = json.decode(response.body);

    for (var user in body) {
      list.add(User.fromJson(user));
    }

    return list;
  }

  @override
  Future<User> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String biography,
  }) async {
    Uri uri = Uri.parse(url + 'signup');
    Map<String, String> body = {
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      biography: biography
    };
    http.Response response = await http.post(uri, body: body);
    var responseBody = json.decode(response.body);
    print('${response.statusCode} status');
    throw UnimplementedError();
  }
}
