import 'package:flutter/material.dart';

import '../../../../ui/widgets/skeleton_bottom_sheet/skeleton_bottom_sheet.dart';

class BottomBarNav extends StatefulWidget {
  const BottomBarNav({super.key});

  @override
  State<BottomBarNav> createState() => _BottomBarNavState();
}

class _BottomBarNavState extends State<BottomBarNav> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
            ),
          ),
          isScrollControlled: true,
          useSafeArea: true,
          backgroundColor: const Color(0xFFE5E5E5),
          builder: (context) => const SkeletonBottomSheet(),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
