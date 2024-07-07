import 'package:calculator_app/helper/helper_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Page'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").snapshots(),
          builder: (context,snapshot){
            if(snapshot.hasError){
              displayMessage('Something went wrong', context);
            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.data==null){
              return const Text('No data');
            }

            final users=snapshot.data!.docs;
            return ListView.builder(
              itemCount: users.length,
                itemBuilder: (context,index) {
                  final user = users[index];

                  return ListTile(
                    title: Text(user['username']),
                    subtitle: Text(user['email']),
                  );
                });
          }),
    );
  }
}
