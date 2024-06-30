import 'package:calculator_app/widgets/buttons.dart';
import 'package:flutter/material.dart';

import '../widgets/my_button.dart';
import '../widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          const SizedBox(height: 50),

          // welcome back, you've been missed!
          Text(
            'Welcome back you\'ve been missed!',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 25),

          // username textfield
          MyTextField(
            controller: usernameController,
            hintText: 'Username',
            obscureText: false,
          ),

          const SizedBox(height: 10),

          // password textfield
          MyTextField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),

          const SizedBox(height: 10),

          // forgot password?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // sign in button
          MyButton(
            onTap: signUserIn,
          ),

          const SizedBox(height: 50),


        ],
      ),
    );
  }
}