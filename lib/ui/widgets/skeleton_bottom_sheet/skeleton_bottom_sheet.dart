import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_finish/models/game_model.dart';
import 'package:games_finish/screens/login/bloc/login_bloc.dart';
import 'package:games_finish/ui/widgets/field/field_custom.dart';

import '../../../screens/home/bloc/product_bloc.dart';
import '../../theme.dart';

class MyChoices {
  MyChoices({required this.choice, required this.index});

  final String choice;
  final int index;
}

class SkeletonBottomSheet extends StatefulWidget {
  const SkeletonBottomSheet({super.key});

  @override
  State<SkeletonBottomSheet> createState() => _SkeletonBottomSheetState();
}

class _SkeletonBottomSheetState extends State<SkeletonBottomSheet> {
  final TextEditingController _titleController = TextEditingController();

  String defaultChoice = 'In progress';
  int defaultIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<MyChoices> choices = <MyChoices>[
      MyChoices(choice: 'In progress', index: 0),
      MyChoices(choice: 'Completed', index: 1),
      MyChoices(choice: 'Platinum', index: 2),
    ];

    addGame() {
      BlocProvider.of<ProductBloc>(context).add(ProductAdd(
          games: GameModel(
        image: "",
        title: _titleController.text,
        status: defaultChoice,
        userUid: BlocProvider.of<LoginBloc>(context).state.user.uid,
      )));
    }

    return DraggableScrollableSheet(
      initialChildSize: 1,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE5E5E5),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50),
              ),
              shape: BoxShape.rectangle,
            ),
            child: Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    'Add a new game',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textDark),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FieldCustom(
                  controller: _titleController,
                  hintText: 'Game name',
                  icon: Icons.gamepad,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: choices
                      .map(
                        (e) => Flexible(
                          flex: 1,
                          child: RadioListTile(
                            toggleable: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Text(
                              e.choice,
                              style: TextStyle(
                                fontSize: 12,
                                color: defaultIndex == e.index
                                    ? Colors.black
                                    : AppTheme.textDark,
                              ),
                            ),
                            value: e.index,
                            groupValue: defaultIndex,
                            onChanged: (value) {
                              setState(() {
                                defaultChoice = e.choice;
                                defaultIndex = e.index;
                              });
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    addGame();
                    // Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Add game', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
