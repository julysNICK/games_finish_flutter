import 'package:flutter/material.dart';
import 'package:games_finish/ui/theme.dart';
import 'package:games_finish/ui/widgets/field/field_custom.dart';

import '../../ui/widgets/button_custom_signin_signup/button_custom_signin_signup.dart';
import '../../ui/widgets/pain_custom_top/paint_custom_top.dart';
import '../login/widgets/paint_custom_right/paint_custom_right.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 500,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 100,
                      child: CustomPaint(
                        size: const Size(
                          414,
                          150,
                        ),
                        painter: RPSCustomPainter(),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Create Account',
                style: TextStyle(
                  color: AppTheme.textDark,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Please fill in the information below to continue',
                style: TextStyle(
                  color: AppTheme.textDark.withOpacity(0.5),
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  child: Column(
                children: [
                  FieldCustom(
                    hintText: 'Name',
                    icon: Icons.person,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FieldCustom(
                    hintText: 'Email',
                    icon: Icons.email,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FieldCustom(
                    hintText: 'Phone Number',
                    icon: Icons.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FieldCustom(
                    hintText: 'Password',
                    icon: Icons.lock,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FieldCustom(
                    hintText: 'Confirm Password',
                    icon: Icons.lock,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            ButtonCustomSignInSignUp(
                              nameButton: 'Create',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        child: CustomPaint(
                          size: const Size(
                            90,
                            70,
                          ),
                          painter: RPSCustomPainterRight(),
                        ),
                      ),
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
