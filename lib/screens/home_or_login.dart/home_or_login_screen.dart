import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../leading/leading_screen.dart';

class HomeOrLoginScreen extends StatefulWidget {
  const HomeOrLoginScreen({super.key});

  @override
  State<HomeOrLoginScreen> createState() => _HomeOrLoginScreenState();
}

class _HomeOrLoginScreenState extends State<HomeOrLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData && snapshot.data != null) {
          return const HomeScreen();
        } else if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        } else {
          return const LeadingGameScreen();
        }
      },
    );
  }
}
