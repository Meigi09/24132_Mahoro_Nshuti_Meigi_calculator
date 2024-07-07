import 'package:calculator_app/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/my_button.dart';
import '../widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onTap;

  const LoginScreen({super.key,required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  Future<void> signIn() async{
    showDialog(
        context: context,
        builder: (context)=>const Center(
          child: CircularProgressIndicator(),
        ));
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);

      if(context.mounted)Navigator.pop(context);
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);
    }

  }



  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            controller: _emailController,
            hintText: 'Email',
            obscureText: false,
          ),

          const SizedBox(height: 10),

          // password textfield
          MyTextField(
            controller: _passwordController,
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
                  style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // sign in button
          MyButton(
            onTap: signIn, label: 'Sign In',
          ),

          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?'),
              GestureDetector(
                onTap: widget.onTap,
                child: const Text(
                    'Register Here',
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
