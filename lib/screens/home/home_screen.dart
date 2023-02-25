import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_finish/screens/home/widgets/bottom_bar/bottom_bar.dart';
import 'package:games_finish/screens/home/widgets/list_grid_items/list_grid_items.dart';
import 'package:games_finish/screens/home/widgets/tab_view/tab_view.dart';
import 'package:games_finish/screens/login/bloc/login_bloc.dart';

import '../../ui/theme.dart';
import '../../ui/widgets/my_bottom_app_bar/my_bottom_app_bar.dart';
import 'bloc/product_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    if (BlocProvider.of<LoginBloc>(context).state is LoginSuccessGetUser &&
        BlocProvider.of<ProductBloc>(context).state.games.isEmpty) {
      BlocProvider.of<ProductBloc>(context).add(GetAllProducts(
        uid: BlocProvider.of<LoginBloc>(context).state.user.uid.toString(),
      ));
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    BlocProvider.of<ProductBloc>(context).close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return DefaultTabController(
            length: 3,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, LoginState state) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.00),
                          child: Text(
                            "Hello ${state.user.name.split('@')[0].toString()}, welcome to the FinishLine",
                            style: const TextStyle(
                                color: AppTheme.textDark,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      },
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
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return const BottomBarNav();
        },
      ),
      extendBody: true,
      bottomNavigationBar: MyBottomAppBarNav(context: context),
    );
  }
}
