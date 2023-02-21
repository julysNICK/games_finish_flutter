import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text('Profile Screen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BottomBarNav(),
      extendBody: true,
      bottomNavigationBar: MyBottomAppBarNav(context: context),
    );
  }
}
