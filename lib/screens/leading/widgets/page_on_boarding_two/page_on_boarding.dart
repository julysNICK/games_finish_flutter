import 'package:flutter/material.dart';

class PageOnBoardingTwo extends StatefulWidget {
  String title;
  String description;
  PageOnBoardingTwo(
      {super.key, required this.title, required this.description});

  @override
  State<PageOnBoardingTwo> createState() => _PageOnBoardingTwoState();
}

class _PageOnBoardingTwoState extends State<PageOnBoardingTwo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/leadingimage3.jpg',
              height: 300.0,
              width: 300.0,
              filterQuality: FilterQuality.low,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text("Come and join us",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 15.0),
          Text(
            widget.description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
