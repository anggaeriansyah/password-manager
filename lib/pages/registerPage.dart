import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:password_manager/controllers/password_controller.dart';
import 'package:password_manager/managers/shared_preference_manager.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    // final PasswordController passwordController = Get.put(PasswordController());
    final PasswordController passwordController = Get.find();
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
              TextFormField(
                controller: passwordController.passwordController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  labelText: 'Password',
                  // labelStyle: TextStyle(color: Theme.of(context).primaryColor),

                  floatingLabelStyle:
                      TextStyle(color: Theme.of(context).primaryColor),
                  // enabledBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  // ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  suffixIcon: IconButton(
                    icon: _obscureText
                        ? Icon(Icons.visibility,
                            color: Theme.of(context).primaryColor)
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController.confirmPasswordController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
                  floatingLabelStyle:
                      TextStyle(color: Theme.of(context).primaryColor),
                  // enabledBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  // ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  suffixIcon: IconButton(
                    icon: _obscureText
                        ? Icon(Icons.visibility,
                            color: Theme.of(context).primaryColor)
                        : Icon(Icons.visibility_off, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Konfirmasi password harus diisi';
                  }
                  return null;
                },
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
