import 'package:flutter/material.dart';
import 'package:screl_machine_test/features/home/view/widgets/alert_dialogue.dart';

class FloatingAddButton extends StatelessWidget {
  const FloatingAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height / 15,
        right: MediaQuery.sizeOf(context).height / 18,
      ),
      child: FloatingActionButton(
        shape: const CircleBorder(),
        tooltip: "Add Users",
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const AddUserDialogue(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
