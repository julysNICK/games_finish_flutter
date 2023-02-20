import 'package:flutter/material.dart';

class SkeletonBottomSheet extends StatefulWidget {
  const SkeletonBottomSheet({super.key});

  @override
  State<SkeletonBottomSheet> createState() => _SkeletonBottomSheetState();
}

class _SkeletonBottomSheetState extends State<SkeletonBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 700,
      child: const Center(
        child: Text("dcqwdqwdwqd"),
      ),
    );
  }
}
