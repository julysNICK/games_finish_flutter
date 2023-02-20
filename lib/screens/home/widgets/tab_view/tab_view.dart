import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../ui/theme.dart';

class TabBarViewHome extends StatelessWidget {
  const TabBarViewHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
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
