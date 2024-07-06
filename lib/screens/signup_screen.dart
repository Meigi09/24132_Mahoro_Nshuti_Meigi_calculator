import 'package:calculator_app/widgets/buttons.dart';
import 'package:flutter/material.dart';

import '../widgets/my_button.dart';
import '../widgets/text_field.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();
  final confPassController = TextEditingController();

  void signUserUp() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Icon(
            Icons.person,
            size: 80,
            color: Theme.of(context).colorScheme.secondary,
          ),
          // welcome back, you've been missed!
          Text(
            'U M U N T U',
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

          MyTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),
          const SizedBox(height: 10),

          MyTextField(
            controller: firstNameController,
            hintText: 'First Name',
            obscureText: false,
          ),
          const SizedBox(height: 10),

          MyTextField(
            controller: secondNameController,
            hintText: 'Last Name',
            obscureText: false,
          ),
          const SizedBox(height: 10),

          MyTextField(
            controller: dobController,
            hintText: 'Date of birth',
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

          // password textfield
          MyTextField(
            controller: confPassController,
            hintText: 'Confirm Password',
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
                  style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // sign in button
          MyButton(
            onTap: signUserUp, label: 'Sign Up',
          ),

          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?'),
              GestureDetector(
                onTap: (){},
                child: const Text(
                  'Login Here',
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
