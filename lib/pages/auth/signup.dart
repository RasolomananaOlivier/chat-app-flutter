import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/api/user_repository.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: firstNameController,
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
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: lastNameController,
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
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
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
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                } else if (value.length < 8) {
                  return 'Password must 8 or more caracteres';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: bioController,
              maxLines: 3,
              decoration: const InputDecoration(
                label: Text('Biography'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                gradient: const LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 4.0,
                  )
                ],
              ),
              child: SignUpButton(
                  formKey: _formKey,
                  emailController: emailController,
                  lastNameController: lastNameController,
                  firstNameController: firstNameController,
                  passwordController: passwordController,
                  bioController: bioController),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text('OR'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have already an account ? "),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    )));
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.lastNameController,
    required this.firstNameController,
    required this.passwordController,
    required this.bioController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController lastNameController;
  final TextEditingController firstNameController;
  final TextEditingController passwordController;
  final TextEditingController bioController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          String email = emailController.text;
          String lastName = lastNameController.text;
          String firstName = firstNameController.text;
          String password = passwordController.text;
          String biography = bioController.text;

          var userRepository = UserRepository();
          userRepository.signUp(
              firstName: firstName,
              lastName: lastName,
              email: email,
              password: password,
              biography: biography);
        }
      },
      child: Text('REGISTER'),
    );
  }
}
