import 'package:flutter/material.dart';
import 'package:games_finish/screens/login/widgets/forgot_password/forgot_password.dart';
import 'package:games_finish/ui/widgets/pain_custom_top/paint_custom_top.dart';
import 'package:games_finish/screens/login/widgets/paint_custom_right/paint_custom_right.dart';
import 'package:games_finish/screens/login/widgets/signup/signup.dart';
import 'package:games_finish/ui/theme.dart';

import '../../ui/widgets/button_custom_signin_signup/button_custom_signin_signup.dart';
import '../../ui/widgets/field/field_custom.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: CustomPaint(
                      size: Size(
                        MediaQuery.of(context).size.width,
                        150,
                      ),
                      painter: RPSCustomPainter(),
                    ),
                  ),
                ],
              ),
              const Text(
                "Hello",
                style: TextStyle(
                    color: AppTheme.textDark,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Welcome to Games Finish",
                style: TextStyle(
                    color: AppTheme.textDark.withOpacity(0.5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                child: Column(
                  children: [
                    FieldCustom(),
                    const SizedBox(
                      height: 30,
                    ),
                    FieldCustom(
                      hintText: "Password",
                      icon: Icons.lock,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ForgotPassword(),
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(
                      children: [
                        Positioned(
                          child: CustomPaint(
                            size: const Size(
                              120,
                              150,
                            ),
                            painter: RPSCustomPainterRight(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              ButtonCustomSignInSignUp(
                                nameButton: "Sign In",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              const SignUp(),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
