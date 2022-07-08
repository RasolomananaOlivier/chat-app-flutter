// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:test2/api/user_repository.dart';
import 'package:test2/controllers/user_controller.dart';
import 'package:test2/data/friendsCollections.dart';
import 'package:test2/data/user_collection.dart';
import 'package:test2/models/user.dart';
import 'package:test2/widgets/conversationList.dart';
import 'package:get/get.dart';
import 'package:test2/widgets/setting_drawer.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  /* Dependency injection */
  final FriendsCollectionsController _friends =
      Get.put(FriendsCollectionsController());

  UserController userController = UserController(UserRepository());

  @override
  void initState() {
    _updateFriendsCollection();
    super.initState();
  }

  void _updateFriendsCollection() async {
    List<User> data = await userController.fetchAllUser();
    _friends.updateAll(data);
  }

  // final CountController count = Get.put(CountController());
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Conversations',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        // count.increment();
                        Get.to(() => SettingDrawer());
                      },
                      icon: const Icon(Icons.person),
                    )
                  ],
                ),
              ),
            ),

            /* Search bar */
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: TextField(
                decoration: InputDecoration(
                  label: const Text('Search'),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.search),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
              ),
            ),

            /* Online list view horizontal */

            /* SizedBox(
            height: 90,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 10),
                itemCount: onlineUsers.length,
                itemBuilder: (BuildContext context, int index) {
                  return ActiveStatus(name: onlineUsers[index].name);
                }),
          ), */
            /*
           List conversations */

            Expanded(
              child: Obx(
                () => (ListView.builder(
                  itemCount: _friends.friendsList.length,
                  padding: const EdgeInsets.all(5),
                  itemBuilder: (BuildContext context, int index) {
                    return ConversationList(
                      name: _friends.friendsList[index].name,
                      imageURL: _friends.friendsList[index].avatarFileName,
                      isMessageRead: (index == 0 ? true : false),
                      id: _friends.friendsCollections[index].id,
                    );
                  },
                )),
              ),
            ),
          ],
        ),
      );
}
