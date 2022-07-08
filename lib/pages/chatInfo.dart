import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/pages/auth/loginPage.dart';

class ChatInfo extends StatefulWidget {
  ChatInfo({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);
  String name, id;
  @override
  State<ChatInfo> createState() => _ChatInfoState();
}

class _ChatInfoState extends State<ChatInfo> {
  void _logOut() => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                )
              ],
            ),
            Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Email@gmail.com',
                )
              ],
            ),
            Expanded(
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
