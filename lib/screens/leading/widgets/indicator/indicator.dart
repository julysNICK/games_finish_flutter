import 'package:flutter/material.dart';

class Indicator extends StatefulWidget {
  bool isActive;
  Indicator({super.key, this.isActive = false});

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: widget.isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: widget.isActive ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
