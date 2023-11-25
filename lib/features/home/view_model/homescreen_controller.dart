import 'package:flutter/material.dart';
import 'package:screl_machine_test/main.dart';

import '../../../utils/hive_box.dart';
import '../model/user_model.dart';

class HomeScreenController extends ChangeNotifier {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController ageEditingController = TextEditingController();
  TextEditingController addressEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController idEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );

  addToDatabase(
      {required String id,
      required String name,
      required String email,
      required String address,
      required DateTime createdAt,
      required BuildContext context}) {
    if (formKey.currentState!.validate()) {
      int userId = int.parse(id);
      if (userBox.containsKey(userId)) {
        scaffoldMessengerKey.currentState!.showSnackBar(
            const SnackBar(content: Text("Userid Already Exists")));
        Navigator.pop(context);
      } else {
        userBox.put(
            userId,
            UserModel(
                id: userId,
                name: name,
                email: email,
                address: address,
                createdAt: createdAt.toString()));
        scaffoldMessengerKey.currentState!
            .showSnackBar(const SnackBar(content: Text("User added")));
        nameEditingController.clear();
        Navigator.pop(context);
        formKey.currentState!.reset();
      }
    }
  }

  deleteFromDatabase(int id) {
    userBox.delete(id);
  }
}
