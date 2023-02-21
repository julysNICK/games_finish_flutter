//   import 'package:flutter/material.dart';

// import '../../theme.dart';

// Expanded option(String defaultChoice, String choice, int defaultIndex, int index) {
//     return Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           defaultChoice = choice;
//                           defaultIndex = index;
//                         });
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 20, horizontal: 10),
//                         decoration: BoxDecoration(
//                           color: defaultIndex == index
//                               ? AppTheme.textDark
//                               : Colors.transparent,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Center(
//                           child: Text(
//                             choice,
//                             style: TextStyle(
//                               color: defaultIndex == index
//                                   ? Colors.white
//                                   : AppTheme.textDark,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//   }

//   List<String> select_game(List<String> choices) => choices;
// }