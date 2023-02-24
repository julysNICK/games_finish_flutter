import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_finish/screens/login/login_screen.dart';
import 'package:games_finish/screens/profile/widgets/card_information_profile.dart';

import '../../ui/widgets/my_bottom_app_bar/my_bottom_app_bar.dart';
import '../home/widgets/bottom_bar/bottom_bar.dart';
import '../login/bloc/login_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              print(state.user.uid);
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/ProfilVector.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CardInformation(
                    titleCardProfile: 'First Name',
                    contentCardProfile: state.user.name,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CardInformation(
                    titleCardProfile: 'Email',
                    contentCardProfile: state.user.email,
                  ),

                  if (state.user.numberPhoneUser.isNotEmpty)
                    CardInformation(
                      titleCardProfile: 'Phone Number',
                      contentCardProfile: '123456789',
                    ),
                  if (state.user.numberPhoneUser.isNotEmpty)
                    CardInformation(
                        titleCardProfile: 'Phone Number',
                        contentCardProfile: state.user.numberPhoneUser),
                  if (state.user.uid!.isNotEmpty)
                    const SizedBox(
                      height: 10,
                    ),
                  if (state.user.uid!.isNotEmpty)
                    CardInformation(
                        titleCardProfile: "User ID",
                        contentCardProfile: state.user.uid!),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // CardInformation(
                  //     titleCardProfile: 'Email',
                  //     contentCardProfile: 'jonhDOe@test.com'),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // CardInformation(
                  //     titleCardProfile: 'Phone Number',
                  //     contentCardProfile: '123456789'),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<LoginBloc>(context)
                          .add(const SignOutButtonPressed());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text('Sign Out'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BottomBarNav(),
      extendBody: true,
      bottomNavigationBar: MyBottomAppBarNav(context: context),
    );
  }
}
