import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/data/user_collection.dart';
import 'package:test2/pages/auth/loginPage.dart';
import 'package:test2/pages/setting/modify_account.dart';
import 'package:test2/theme.dart';

Widget _dialogueWidget(BuildContext context) {
  void _logOut() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  return Dialog(
      child: SizedBox(
    height: 150,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Do you really want to log out ?',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No I don't think"),
              ),
              ElevatedButton(
                onPressed: _logOut,
                child: const Text("Yes, of course"),
              )
            ],
          ),
        )
      ],
    ),
  ));
}

class SettingDrawer extends StatefulWidget {
  const SettingDrawer({Key? key}) : super(key: key);

  @override
  State<SettingDrawer> createState() => _SettingDrawerState();
}

class _SettingDrawerState extends State<SettingDrawer> {
  final InfoController _user = Get.put(InfoController());

  final ThemeController theme = Get.put(ThemeController());

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
                    Navigator.pushNamed(context, '/home');
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
                Obx(
                  () => (Text(
                    _user.user.value.name,
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  )),
                ),
                const SizedBox(
                  height: 8,
                ),
                Obx(
                  () => Text(
                    _user.user.value.email,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black87,
                            ),
                            child: const Icon(
                              Icons.nights_stay,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Dark mode'),
                          const Spacer(flex: 1),
                          Obx(() {
                            var dark = !theme.dark;
                            return (Switch(
                                value: dark,
                                onChanged: (dark) {
                                  theme.toggle();
                                }));
                          })
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => AccountSettingPage());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightBlue,
                            ),
                            child: const Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Modify account'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                            child: const Icon(
                              Icons.security,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Change password'),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return _dialogueWidget(context);
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.redAccent,
                            ),
                            child: const Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Log Out'),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
