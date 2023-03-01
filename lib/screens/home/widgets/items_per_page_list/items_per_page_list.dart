import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/game_model.dart';
import '../../bloc/product_bloc.dart';
import '../card_game/card_game.dart';

class ItemsPerPage extends StatefulWidget {
  const ItemsPerPage({
    super.key,
  });

  @override
  State<ItemsPerPage> createState() => _ItemsPerPageState();
}

class _ItemsPerPageState extends State<ItemsPerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {},
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
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
            itemCount: state.status == 'all'
                ? state.games.length
                : state.gamesListSearch.length,
            itemBuilder: (context, index) {
              final GameModel game = state.games[index];

              return CardGame(
                title: game.title,
                status: game.status,
              );
            },
          );
        },
      ),
    );
  }
}
