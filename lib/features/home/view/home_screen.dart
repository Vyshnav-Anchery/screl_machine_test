import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:screl_machine_test/features/home/model/user_model.dart';
import 'package:screl_machine_test/features/home/view/widgets/floating_add_button.dart';
import 'package:screl_machine_test/utils/hive_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingAddButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: ListenableBuilder(
                  listenable: userBox.listenable(),
                  builder: (context, child) {
                    if (userBox.values.isEmpty) {
                      return const Center(
                        child: Text("No user found..!"),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: userBox.values.length,
                        itemBuilder: (BuildContext context, int index) {
                          UserModel? userDetails = userBox.getAt(index);
                          return ListTile(
                            title: Text(userDetails!.name),
                            subtitle: Text(userDetails.email),
                          );
                        },
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
