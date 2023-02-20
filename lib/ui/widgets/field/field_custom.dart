import 'package:flutter/material.dart';

import '../../theme.dart';

class FieldCustom extends StatelessWidget {
  FieldCustom({
    super.key,
    this.hintText = "Email",
    this.icon = Icons.email,
  });
  String hintText;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(30, 10),
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: AppTheme.textDark,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppTheme.textDark,
            fontSize: 20,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90)),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90)),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
