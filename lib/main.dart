import 'package:clothes_app/users/authentification/login_screen.dart';
import 'package:clothes_app/users/fragmants/dashboard_of_fragmants.dart';
import 'package:clothes_app/users/userPreferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Clothes Store App',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: RememberUserPrefs.readUserInfo(),
        builder: (context, DataSnapShot) {
          if (DataSnapShot.data == null) {
            return LoginScreen();
          } else {
            return DashboardOfFragmants();
          }
        },
      ),
    );
  }
}
