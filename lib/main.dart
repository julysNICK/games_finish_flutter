import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_finish/screens/home/bloc/product_bloc.dart';
import 'package:games_finish/screens/home_or_login.dart/home_or_login_screen.dart';
import 'package:games_finish/screens/login/bloc/login_bloc.dart';
import 'package:games_finish/screens/register/bloc/register_bloc.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    runApp(MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
          child: const MyApp(),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
          child: const MyApp(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(),
          child: const MyApp(),
        ),
      ],
      child: const MyApp(),
    ));
  } catch (e) {
    print(e);
    runApp(const ErrorScreen());
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeOrLoginScreen(),
    );
  }
}
