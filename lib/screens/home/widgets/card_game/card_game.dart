import 'package:flutter/material.dart';

import '../../../details_game/game_details_screen.dart';

class CardGame extends StatelessWidget {
  String imagePath = 'assets/download.jpeg';
  String title = 'The witcher 3';
  String status = 'Completed';

  CardGame({
    super.key,
    this.imagePath = 'assets/download.jpeg',
    this.title = 'The witcher 3',
    this.status = 'Completed',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailsGameScreen(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
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
        child: Column(
          children: [
            InkWell(
              child: Image(
                image: AssetImage(imagePath),
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8.00,
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 2.00,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: const [
            //     Text(
            //       "Status: Completed",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 15,
            //       ),
            //     ),
            //     Icon(
            //       Icons.check_circle,
            //       color: Colors.green,
            //       size: 15,
            //     ),
            //   ],
            // )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: const [
            //     Text(
            //       "Status: In progress",
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 15,
            //       ),
            //     ),
            //     Icon(
            //       Icons.av_timer_rounded,
            //       color: Colors.white,
            //       size: 15,
            //     ),
            //   ],
            // )
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Status: $status",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.diamond_outlined,
                  color: Colors.green,
                  size: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
