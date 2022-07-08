import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/data/user_collection.dart';

class AccountSettingPage extends StatefulWidget {
  AccountSettingPage({Key? key}) : super(key: key);

  @override
  State<AccountSettingPage> createState() => _AccountSettingPageState();
}

class _AccountSettingPageState extends State<AccountSettingPage> {
  final _formKey = GlobalKey<FormState>();

  late String email;
  late String lastName;
  late String firstName;
  late String biography;

  final InfoController _user = InfoController();
  @override
  void initState() {
    email = _user.user.value.email;
    lastName = _user.user.value.lastName;
    firstName = _user.user.value.firstName;
    biography = _user.user.value.bio;
    super.initState();
  }

  final InfoController o = Get.put(InfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
              o.val.value,
              style: const TextStyle(color: Colors.black),
            )),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: firstName,
                decoration: const InputDecoration(
                  label: Text('First name'),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    lastName = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: lastName,
                decoration: const InputDecoration(
                  label: Text('Last name'),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    lastName = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: email,
                decoration: const InputDecoration(
                  label: Text('Email'),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your  email';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: biography,
                maxLines: 3,
                decoration: const InputDecoration(
                  label: Text('Biography'),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    biography = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ActionWidget(
                  formKey: _formKey,
                  email: email,
                  lastName: lastName,
                  firstName: firstName,
                  bio: biography),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionWidget extends StatelessWidget {
  ActionWidget({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.bio,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final String email;
  final String lastName;
  final String firstName;
  final String bio;

  final InfoController user = Get.put(InfoController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            user.updateData(
                firstName: firstName,
                email: email,
                lastName: lastName,
                bio: bio);
            Get.snackbar(
              'Account',
              'Your account was successfully updated',
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              margin: const EdgeInsets.all(4),
              icon: const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
            );
          },
          child: const Text('Update'),
        ),
        const SizedBox(
          width: 20,
        ),
        OutlinedButton(onPressed: () {}, child: const Text('Cancel'))
      ],
    );
  }
}
