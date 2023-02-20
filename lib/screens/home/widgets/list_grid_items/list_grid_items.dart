import 'package:flutter/material.dart';

import '../items_per_page_list/items_per_page_list.dart';

class ListGridItems extends StatelessWidget {
  const ListGridItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        ItemsPerPage(),
        ItemsPerPage(),
        ItemsPerPage(),
      ],
    );
  }
}
