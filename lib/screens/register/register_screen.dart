import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_finish/screens/register/bloc/register_bloc.dart';
import 'package:games_finish/ui/theme.dart';

import '../../models/user_model.dart';
import '../../services/register_services.dart';
import '../../ui/widgets/button_custom_signin_signup/button_custom_signin_signup.dart';
import '../../ui/widgets/field/field_custom.dart';
import '../../ui/widgets/pain_custom_top/paint_custom_top.dart';

import '../../utils/throw_messa_error.dart';
import '../login/login_screen.dart';
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
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isError = false;
  final RegisterServices _registerServices = RegisterServices();
  final User user = User(
    userFullName: "",
    userEmail: "",
    userPassword: "",
    userPhone: "",
    userUid: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          }
        },
        child: SingleChildScrollView(
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
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FieldCustom(
                            controller: _confirmPasswordController,
                            hintText: 'Confirm Password',
                            icon: Icons.lock,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (_isError)
                            Text(
                              ThrowMessageFieldsUsers(user: user)
                                      .throwMessageEmpty()
                                      .isEmpty
                                  ? ThrowMessageFieldsUsers(user: user)
                                      .throwMessageVerifyFields(
                                          _confirmPasswordController.text)
                                  : ThrowMessageFieldsUsers(user: user)
                                      .throwMessageEmpty(),
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                              ),
                            ),
                          if (state is RegisterLoadingState)
                            const Center(
                              child: CircularProgressIndicator(),
                            ),
                          if (state is RegisterFailureState)
                            Text(state.message),
                          Stack(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  children: [
                                    ButtonCustomSignInSignUp(
                                      nameButton: 'Create',
                                      onPressed: () async {
                                        if (state is RegisterLoadingState) {
                                          return;
                                        }
                                        user.userFullName =
                                            _nameController.text;
                                        user.userEmail = _emailController.text;
                                        user.userPassword =
                                            _passwordController.text;
                                        user.userPhone =
                                            _numberPhoneCOntroll.text;
                                        if (ThrowMessageFieldsUsers(user: user)
                                                .throwMessageEmpty()
                                                .isEmpty ||
                                            ThrowMessageFieldsUsers(user: user)
                                                .throwMessageVerifyFields(
                                                    _confirmPasswordController
                                                        .text)
                                                .isEmpty) {
                                          setState(() {
                                            _isError = false;
                                          });
                                          BlocProvider.of<RegisterBloc>(context)
                                              .add(RegisterButtonPressed(
                                                  user: user));
                                        }
                                        ThrowMessageFieldsUsers(user: user)
                                            .throwMessageEmpty();
                                        setState(() {
                                          _isError = true;
                                        });
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
                          ),
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
