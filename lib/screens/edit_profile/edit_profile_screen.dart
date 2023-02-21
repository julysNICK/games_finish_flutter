import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  String name;
  EditProfileScreen({super.key, required this.name});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              decoration: InputDecoration(
                hintText: widget.name,
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Color(0xFF232227),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                filled: true,
                fillColor: Colors.black.withOpacity(0.4),
              ),
            ),
          ),
          const SizedBox(
            height: 190,
          ),
        ],
      ),
    );
  }
}
