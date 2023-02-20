import 'package:flutter/material.dart';

import '../card_game/card_game.dart';

class ItemsPerPage extends StatelessWidget {
  const ItemsPerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      cacheExtent: 1000,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        mainAxisExtent: 205,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CardGame();
      },
    );
  }
}
