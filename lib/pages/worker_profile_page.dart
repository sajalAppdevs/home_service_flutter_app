import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/show_snackbar.dart';

class WorkerProfilePage extends StatefulWidget {
  final String userProfile;

  const WorkerProfilePage(this.userProfile, {super.key});

  @override
  WorkerProfilePageState createState() => WorkerProfilePageState();
}

class WorkerProfilePageState extends State<WorkerProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

  Future<void> verifyEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      debugPrint('Verification Email has been sent.');
      if (!mounted) return;
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBar('Verification Email has been sent'),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Hero(
                  tag: 'userProfile',
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(widget.userProfile),
                  ),
                ),
              ),
              Text('User ID: $uid'),
              const SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    'Email: $email',
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  user!.emailVerified
                      ? const Text('verified')
                      : TextButton(
                          onPressed: verifyEmail,
                          child: const Text('Verify Email'),
                        ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Created: $creationTime',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      );
}
