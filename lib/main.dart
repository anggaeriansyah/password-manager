import 'package:flutter/material.dart';
import 'package:password_manager/controllers/password_controller.dart';
import 'package:password_manager/pages/loginPage.dart';
import 'package:password_manager/managers/shared_preference_manager.dart';
import 'package:password_manager/pages/registerPage.dart';
import 'package:get/get.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green[600],
  );

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    final PasswordController passwordController = Get.put(PasswordController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme, // Tema light mode
      darkTheme: darkTheme, // Set tema sesuai status saat ini
      home: FutureBuilder<bool>(
        future: SharedPreferencesManager.hasPassword(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Menampilkan tampilan loading jika sedang memeriksa password
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasData && snapshot.data == true) {
            // Password ada, tampilkan LoginPage
            return LoginPage();
          } else {
            // Password tidak ada, tampilkan RegisterPage
            return RegisterPage();
          }
        },
      ),
    );
  }
}
