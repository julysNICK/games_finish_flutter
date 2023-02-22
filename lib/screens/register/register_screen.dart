import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_finish/screens/register/bloc/register_bloc.dart';
import 'package:games_finish/ui/theme.dart';

import '../../models/user_model.dart';
import '../../services/register_services.dart';
import '../../ui/widgets/button_custom_signin_signup/button_custom_signin_signup.dart';
import '../../ui/widgets/field/field_custom.dart';
import '../../ui/widgets/pain_custom_top/paint_custom_top.dart';
import '../login/widgets/paint_custom_right/paint_custom_right.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _numberPhoneCOntroll = TextEditingController();
  final RegisterServices _registerServices = RegisterServices();
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
              BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, RegisterState state) {
                  return Form(
                    child: Column(
                      children: [
                        FieldCustom(
                          controller: _nameController,
                          hintText: 'Name',
                          icon: Icons.person,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FieldCustom(
                          controller: _emailController,
                          hintText: 'Email',
                          icon: Icons.email,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FieldCustom(
                          controller: _numberPhoneCOntroll,
                          hintText: 'Phone Number',
                          icon: Icons.phone,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FieldCustom(
                          controller: _passwordController,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                children: [
                                  ButtonCustomSignInSignUp(
                                    nameButton: 'Create',
                                    onPressed: (context) async {
                                      try {
                                        await _registerServices.register(
                                          User(
                                            userEmail: _emailController.text,
                                            userPassword:
                                                _passwordController.text,
                                            userFullName: _nameController.text,
                                            userPhone:
                                                _numberPhoneCOntroll.text,
                                          ),
                                        );
                                      } catch (e) {
                                        print(e);
                                      }
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
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
