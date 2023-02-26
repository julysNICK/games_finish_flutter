import 'package:flutter/material.dart';

class PageOnBoarding extends StatefulWidget {
  String imagePath;
  String title;
  String description;
  PageOnBoarding(
      {super.key,
      this.imagePath = "assets/leadingimage2.jpg",
      required this.title,
      required this.description});

  @override
  State<PageOnBoarding> createState() => _PageOnBoardingState();
}

class _PageOnBoardingState extends State<PageOnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              widget.imagePath,
              height: 300.0,
              width: 300.0,
              filterQuality: FilterQuality.low,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(widget.title,
              style: const TextStyle(
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
