import 'package:flutter/material.dart';
import 'package:games_finish/screens/profile/widgets/card_information_profile.dart';

import '../../ui/widgets/my_bottom_app_bar/my_bottom_app_bar.dart';
import '../home/widgets/bottom_bar/bottom_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                  color: Colors.red,
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
                      offset: const Offset(0, 3), // changes position of shadow
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
              contentCardProfile: 'John',
            ),
            const SizedBox(
              height: 10,
            ),
            CardInformation(
              titleCardProfile: 'Last Name',
              contentCardProfile: 'Doe',
            ),
            const SizedBox(
              height: 10,
            ),
            CardInformation(
                titleCardProfile: 'Email',
                contentCardProfile: 'jonhDOe@test.com'),
            const SizedBox(
              height: 10,
            ),
            CardInformation(
                titleCardProfile: 'Phone Number',
                contentCardProfile: '123456789'),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BottomBarNav(),
      extendBody: true,
      bottomNavigationBar: MyBottomAppBarNav(context: context),
    );
  }
}
