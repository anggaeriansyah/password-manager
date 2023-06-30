import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void validatePassword() {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (password.isEmpty || confirmPassword.isEmpty) {
      // Password dan konfirmasi password sama
      Get.defaultDialog(
        title: 'Error',
        middleText: 'lengkapi password terlebih dahulu.',
      );
    } else if (password == confirmPassword) {
      Get.defaultDialog(
        title: 'Success',
        middleText: 'Password and Confirmation Password are the same.',
      );
    } else {
      // Password dan konfirmasi password tidak sama
      Get.defaultDialog(
        title: 'Error',
        middleText: 'Password and Confirmation Password are not the same.',
      );
    }
  }
}
