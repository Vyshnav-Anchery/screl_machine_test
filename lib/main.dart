import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:screl_machine_test/features/home/view_model/homescreen_controller.dart';
import 'package:screl_machine_test/features/home/model/user_model.dart';
import 'package:screl_machine_test/utils/constants.dart';
import 'package:screl_machine_test/utils/hive_box.dart';
import 'package:screl_machine_test/utils/theme_constants.dart';
import 'package:provider/provider.dart';
import 'features/home/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  if (Hive.isBoxOpen(AppConstants.hiveBoxName)) {
    userBox = Hive.box<UserModel>(AppConstants.hiveBoxName);
  } else {
    await Hive.openBox<UserModel>(AppConstants.hiveBoxName);
    userBox = Hive.box<UserModel>(AppConstants.hiveBoxName);
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HomeScreenController(),
    )
  ], child: const MyApp()));
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      title: 'User Management',
      theme: ThemeConstants.themeData,
      home: const HomeScreen(),
    );
  }
}
