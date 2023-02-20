import 'package:flutter/material.dart';

import '../../theme.dart';

class ButtonCustomSignInSignUp extends StatelessWidget {
  ButtonCustomSignInSignUp(
      {super.key, required this.nameButton, required this.onPressed});

  String nameButton = "Sign In";

  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            nameButton,
            style: const TextStyle(
                color: AppTheme.textDark,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            height: 40,
            width: 90,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(90),
              ),
              gradient: AppTheme.linearGradient,
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
