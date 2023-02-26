import 'package:flutter/material.dart';

class PageOnBoardingOne extends StatefulWidget {
  const PageOnBoardingOne({
    super.key,
  });

  @override
  State<PageOnBoardingOne> createState() => _PageOnBoardingOneState();
}

class _PageOnBoardingOneState extends State<PageOnBoardingOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/leadingimage2.jpg',
              height: 300.0,
              width: 300.0,
              filterQuality: FilterQuality.low,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text("Save your progress",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 15.0),
          const Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
