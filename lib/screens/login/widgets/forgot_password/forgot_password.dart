import 'package:flutter/material.dart';

Container ForgotPassword() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        SizedBox(
          width: 30,
        ),
        Text(
          "Forgot Password?",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
