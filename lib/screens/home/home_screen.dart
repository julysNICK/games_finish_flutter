import 'package:flutter/material.dart';
import 'package:games_finish/screens/home/widgets/bottom_bar/bottom_bar.dart';
import 'package:games_finish/screens/home/widgets/list_grid_items/list_grid_items.dart';
import 'package:games_finish/screens/home/widgets/tab_view/tab_view.dart';

import '../../ui/theme.dart';
import '../../ui/widgets/my_bottom_app_bar/my_bottom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.00),
                  child: Text(
                    'FinishLine',
                    style: TextStyle(
                        color: AppTheme.textDark,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.00),
                  child: Text(
                    'the best way to store your finished games',
                    style: TextStyle(
                      color: AppTheme.textDark.withOpacity(0.5),
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TabBarViewHome(),
                const SizedBox(
                  height: 20,
                ),
                const Flexible(
                  flex: 1,
                  child: ListGridItems(),
                ),
              ],
            ),
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
