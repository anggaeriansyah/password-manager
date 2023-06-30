import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:password_manager/controllers/password_controller.dart';
import 'package:password_manager/managers/shared_preference_manager.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final PasswordController passwordController = Get.put(PasswordController());
    final PasswordController passwordController = Get.find();
    // TextEditingController passwordController = TextEditingController();
    // TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Password'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: passwordController.passwordController,
                obscureText: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: passwordController.confirmPasswordController,
                obscureText: true,
                enableInteractiveSelection: false,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () {
                  passwordController.validatePassword();
                },
                child: Text('Submit'),
              ),
            ],
          )),
    );
  }
}
