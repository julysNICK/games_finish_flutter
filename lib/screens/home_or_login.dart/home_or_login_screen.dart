import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_finish/screens/home/bloc/product_bloc.dart';

import '../home/home_screen.dart';
import '../login/login_screen.dart';

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
        } else if (snapshot.hasData) {
          BlocProvider.of<ProductBloc>(context)
              .add(GetAllProducts(uid: FirebaseAuth.instance.currentUser!.uid));
          return const HomeScreen();
        } else if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
