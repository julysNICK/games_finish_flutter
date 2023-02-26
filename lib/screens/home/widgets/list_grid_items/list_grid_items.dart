import 'package:flutter/material.dart';

import '../items_per_page_list/items_per_page_list.dart';

class ListGridItems extends StatefulWidget {
  TabController? controllerSwipper;

  ListGridItems({
    super.key,
    required this.controllerSwipper,
  });

  @override
  State<ListGridItems> createState() => _ListGridItemsState();
}

class _ListGridItemsState extends State<ListGridItems>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.controllerSwipper,
      children: const [
        ItemsPerPage(),
        ItemsPerPage(),
        ItemsPerPage(),
        ItemsPerPage(),
      ],
    );
  }
}
