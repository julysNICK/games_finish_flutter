import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ui/theme.dart';
import '../../bloc/product_bloc.dart';

class TabBarViewHome extends StatelessWidget {
  const TabBarViewHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductBloc>(context)
        .add(const PressButtonStatusSwitch(status: 'inProgress'));
    return TabBar(
      onTap: (index) {
        switch (index) {
          case 0:
            BlocProvider.of<ProductBloc>(context)
                .add(const PressButtonStatusSwitch(status: 'all'));
            break;

          case 1:
            BlocProvider.of<ProductBloc>(context)
                .add(const PressButtonStatusSwitch(status: 'inProgress'));
            break;
          case 2:
            BlocProvider.of<ProductBloc>(context)
                .add(const PressButtonStatusSwitch(status: 'completed'));
            break;
          case 3:
            BlocProvider.of<ProductBloc>(context)
                .add(const PressButtonStatusSwitch(status: 'platinum'));
            break;
        }
      },
      controller: DefaultTabController.of(context),
      isScrollable: true,
      physics: const BouncingScrollPhysics(),
      indicatorColor: Colors.red,
      indicatorWeight: 3,
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: Colors.blue,
      dragStartBehavior: DragStartBehavior.start,
      labelColor: AppTheme.textDark,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 10.00),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
      unselectedLabelColor: AppTheme.textDark.withOpacity(0.6),
      tabs: const [
        Tab(
          text: 'All',
        ),
        Tab(
          text: 'In Progress',
        ),
        Tab(
          text: 'Completed',
        ),
        Tab(
          text: 'Platinum',
        ),
      ],
      labelPadding: const EdgeInsets.symmetric(horizontal: 20.00),
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppTheme.textDark,
      ),
    );
  }
}
