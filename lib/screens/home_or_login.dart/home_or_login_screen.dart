import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_finish/screens/login/login_screen.dart';

import '../home/home_screen.dart';
import '../leading/leading_screen.dart';
import '../login/bloc/login_bloc.dart';

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
          return BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state.user.uid != null && state.user.uid!.isNotEmpty) {
                return const HomeScreen();
              } else {
                return const LoginScreen();
              }
            },
          );
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
