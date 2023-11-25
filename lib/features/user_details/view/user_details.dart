import 'package:flutter/material.dart';
import 'package:screl_machine_test/features/home/model/user_model.dart';

class UserDetails extends StatelessWidget {
  final UserModel userDetails;
  const UserDetails({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    DateTime createdTime = DateTime.parse(userDetails.createdAt);
    return Scaffold(
      appBar: AppBar(
        title: Text(userDetails.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                const Text("User id : "),
                Text(userDetails.id.toString()),
              ]),
              const SizedBox(height: 40),
              Row(children: [
                const Text("User Name : "),
                Text(userDetails.name),
              ]),
              const SizedBox(height: 40),
              Row(children: [
                const Text("Email : "),
                Text(userDetails.email),
              ]),
              const SizedBox(height: 40),
              Row(children: [
                const Text("User address : "),
                Text(
                  userDetails.address,
                  maxLines: 2,
                  softWrap: true,
                ),
              ]),
              const SizedBox(height: 40),
              Row(children: [
                const Text("Account Created Date: "),
                Text(
                    "${createdTime.year}-${createdTime.month}-${createdTime.day}"),
              ]),
              const SizedBox(height: 40),
              Row(children: [
                const Text("Account Created Time: "),
                Text(
                    "${createdTime.hour}:${createdTime.minute}:${createdTime.second}"),
              ]),
              const SizedBox(height: 40),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Go Back"))
            ],
          ),
        ),
      ),
    );
  }
}
