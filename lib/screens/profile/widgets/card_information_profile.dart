import 'package:flutter/material.dart';

import '../../edit_profile/edit_profile_screen.dart';

class CardInformation extends StatelessWidget {
  CardInformation({
    super.key,
    required this.titleCardProfile,
    required this.contentCardProfile,
  });
  String titleCardProfile;
  String contentCardProfile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditProfileScreen(
              name: titleCardProfile,
            ),
          ),
        );
      },
      child: Container(
        width: 300,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF232227),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 0.5,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            titleCardProfile,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(contentCardProfile,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ]),
      ),
    );
  }
}
