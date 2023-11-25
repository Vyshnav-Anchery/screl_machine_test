import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screl_machine_test/utils/common%20widgets/form_fields.dart';
import 'package:screl_machine_test/utils/common%20widgets/text_buttons.dart';

import '../../view_model/homescreen_controller.dart';

class AddUserDialogue extends StatelessWidget {
  const AddUserDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeScreenController =
        Provider.of<HomeScreenController>(context, listen: false);
    return AlertDialog(
      title: const Text("Add user"),
      content: SingleChildScrollView(
        child: Form(
            key: homeScreenController.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomFormField(
                  label: "User id",
                  isInt: true,
                  textEditingController:
                      homeScreenController.idEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter user id";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
                  label: "User Name",
                  textEditingController:
                      homeScreenController.nameEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter Username";
                    } else if (value.length < 4) {
                      return "Username must contain atleast four charactors";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
                  label: "Email",
                  textEditingController:
                      homeScreenController.emailEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter email address";
                    } else if (!homeScreenController.emailRegExp
                        .hasMatch(value)) {
                      return "Enter proper email address";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
                  label: "Address",
                  textEditingController:
                      homeScreenController.addressEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter email address";
                    } else if (value.length < 10) {
                      return "Username must contain atleast ten charactors";
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            )),
      ),
      actions: [
        CustomTextButton(
            function: () {
              Navigator.pop(context);
            },
            text: "Cancel"),
        CustomTextButton(
            function: () {
              homeScreenController.addToDatabase(
                  context: context,
                  id: homeScreenController.idEditingController.text,
                  name: homeScreenController.nameEditingController.text,
                  email: homeScreenController.emailEditingController.text,
                  address: homeScreenController.addressEditingController.text,
                  createdAt: DateTime.now());
            },
            text: "Add User"),
      ],
    );
  }
}
