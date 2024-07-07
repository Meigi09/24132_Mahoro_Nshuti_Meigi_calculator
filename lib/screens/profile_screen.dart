import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  User? currentUser=FirebaseAuth.instance.currentUser;
  Future<DocumentSnapshot<Map<String,dynamic>>> getUserDetails() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return Future.value(null); // Handle case where user is not logged in
    }
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<DocumentSnapshot<Map<String,dynamic>>>(
          future: getUserDetails(),
          builder: (context,snapshot){
            if(snapshot.connectionState== ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(snapshot.hasError){
              return Text('Error:${snapshot.error}');
            }else if(snapshot.hasData&& snapshot.data!.exists){
              Map<String,dynamic>? user=snapshot.data!.data();

              return Center(
                child: Column(
                  children: [
                    Text(user!['email']),
                    Text(user['username']),
                  ],
                ),
              );
            }else{
              return Text('No data');
            }
          }),
    );
  }
}
