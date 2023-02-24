import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_finish/screens/login/widgets/forgot_password/forgot_password.dart';
import 'package:games_finish/ui/widgets/pain_custom_top/paint_custom_top.dart';
import 'package:games_finish/screens/login/widgets/paint_custom_right/paint_custom_right.dart';
import 'package:games_finish/screens/login/widgets/signup/signup.dart';
import 'package:games_finish/ui/theme.dart';

import '../../ui/widgets/button_custom_signin_signup/button_custom_signin_signup.dart';
import '../../ui/widgets/field/field_custom.dart';
import '../../utils/throw_messa_error.dart';
import '../home/home_screen.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ThrowMessageFieldsUsers _throwMessageFieldsUsers =
      ThrowMessageFieldsUsers();
  bool _isError = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }

          if (state is LoginFailure) {
            if (state.error.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          }
        },
        child: SingleChildScrollView(
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
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, LoginState state) {
                    return Form(
                      child: Column(
                        children: [
                          FieldCustom(
                            controller: _emailController,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          FieldCustom(
                            controller: _passwordController,
                            hintText: "Password",
                            icon: Icons.lock,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          if (_isError)
                            Text(
                              _throwMessageFieldsUsers
                                      .throwMessageVerifyEmptyFields(
                                          _emailController.text,
                                          _passwordController.text)
                                      .isEmpty
                                  ? _throwMessageFieldsUsers
                                      .throwMessageValidatorFieldsLogin(
                                          _emailController.text,
                                          _passwordController.text)
                                  : _throwMessageFieldsUsers
                                      .throwMessageVerifyEmptyFields(
                                          _emailController.text,
                                          _passwordController.text),
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 14),
                            ),
                          if (_isError)
                            const SizedBox(
                              height: 10,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  children: [
                                    ButtonCustomSignInSignUp(
                                      nameButton: "Sign In",
                                      onPressed: () async {
                                        if (_throwMessageFieldsUsers
                                                .throwMessageVerifyEmptyFields(
                                                    _emailController.text,
                                                    _passwordController.text)
                                                .isEmpty &&
                                            _throwMessageFieldsUsers
                                                .throwMessageValidatorFieldsLogin(
                                                    _emailController.text,
                                                    _passwordController.text)
                                                .isEmpty) {
                                          setState(() {
                                            _isError = false;
                                          });
                                          BlocProvider.of<LoginBloc>(context)
                                              .add(
                                            LoginButtonPressed(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                            ),
                                          );

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen(),
                                            ),
                                          );

                                          if (state.error.isNotEmpty) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(state.error),
                                              ),
                                            );
                                          }

                                          return;
                                        }
                                        setState(() {
                                          _isError = true;
                                        });
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
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
