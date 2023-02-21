import 'package:flutter/material.dart';

import '../../../details_game/game_details_screen.dart';

class CardGame extends StatelessWidget {
  const CardGame({
    super.key,
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
            const InkWell(
              child: Image(
                image: AssetImage('assets/download.jpeg'),
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
                child: const Text(
                  'The witcher 3',
                  style: TextStyle(
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
              children: const [
                Text(
                  "Status: Platinum",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
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
