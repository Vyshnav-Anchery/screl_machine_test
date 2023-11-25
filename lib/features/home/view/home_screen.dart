import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:screl_machine_test/features/home/model/user_model.dart';
import 'package:screl_machine_test/features/home/view/widgets/floating_add_button.dart';
import 'package:screl_machine_test/features/home/view_model/homescreen_controller.dart';
import 'package:screl_machine_test/features/user_details/view/user_details.dart';
import 'package:screl_machine_test/utils/common%20widgets/text_buttons.dart';
import 'package:screl_machine_test/utils/hive_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController =
        Provider.of<HomeScreenController>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
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
                      return ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: userBox.values.length,
                        itemBuilder: (BuildContext context, int index) {
                          UserModel? userDetails = userBox.getAt(index);
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserDetails(userDetails: userDetails),
                                  ));
                            },
                            title: Text(userDetails!.name),
                            subtitle: Text(userDetails.email),
                            trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                        title: const Text("Confirm deletion"),
                                        content: Text(
                                            "Delte ther user? \n user name:${userDetails.name}"),
                                        actions: [
                                          CustomTextButton(
                                              function: () {
                                                Navigator.pop(context);
                                              },
                                              text: "Cancel"),
                                          CustomTextButton(
                                              function: () {
                                                homeScreenController
                                                    .deleteFromDatabase(
                                                        userDetails.id,
                                                        context);
                                              },
                                              text: "Confirm"),
                                        ]),
                                  );
                                },
                                icon: const Icon(Icons.delete)),
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
