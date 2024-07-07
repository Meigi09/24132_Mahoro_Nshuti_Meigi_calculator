import 'package:calculator_app/helper/helper_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/my_button.dart';
import '../widgets/text_field.dart';

class RegistrationScreen extends StatefulWidget {
  final void Function()? onTap;
  const RegistrationScreen({super.key, required this.onTap});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // Use underscores for private variables
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _secondNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confPassController = TextEditingController();

  // Dispose controllers when the widget is disposed
  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _secondNameController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    _confPassController.dispose();
    super.dispose();
  }

  Future<void> _signUserUp() async {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (_passwordController.text != _confPassController.text) {
      Navigator.pop(context);
      displayMessage("Passwords don't match", context);
      return; // Exit early if passwords don't match
    }else {
      try {
        UserCredential? userCredential=
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(), // Trim whitespace
          password: _passwordController.text.trim(),
        );
        createUserDoc(userCredential);
        if(context.mounted) Navigator.pop(context);
      }on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        displayMessage(e.code, context);
      }
    }
  }
  Future<void> createUserDoc(UserCredential? userCredential) async{
    if(userCredential!=null&& userCredential.user!=null){
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email':userCredential.user!.email,
        'username':_usernameController.text,
        'first name':_firstNameController.text,
        'second name':_secondNameController.text,
        'date of birth':_dobController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      body: SingleChildScrollView( // Wrap with SingleChildScrollView for scrollability
        child: Column(
          children: [
            const SizedBox(height: 50),
            Icon(
              Icons.person,
              size: 80,
              color: Theme
                  .of(context)
                  .colorScheme
                  .secondary,
            ),
            Text(
              'U M U N T U',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 25),

            // Text fields with consistent spacing
            MyTextField(
              controller: _usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            const SizedBox(height: 15), // Increased spacing

            MyTextField(
              controller: _emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            const SizedBox(height: 15),

            MyTextField(
              controller: _firstNameController,
              hintText: 'First Name',
              obscureText: false,
            ),

            const SizedBox(height: 15),

            MyTextField(
              controller: _secondNameController,
              hintText: 'Second Name',
              obscureText: false,
            ),
            const SizedBox(height: 15),

            MyTextField(
              controller: _dobController,
              hintText: 'Date of Birth',
              obscureText: false,
            ),
            const SizedBox(height: 15),

            MyTextField(
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 15),

            MyTextField(
              controller: _confPassController,
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            // ... (rest of your text fields)

            const SizedBox(height: 25),

            MyButton(
              onTap: _signUserUp,
              label: 'Sign Up',
            ),

            const SizedBox(height: 20), // Increased spacing

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    ' Login Here', // Added space for better readability
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25), // Add bottom padding
          ],
        ),
      ),
    );
  }
}