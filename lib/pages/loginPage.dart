import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:password_manager/managers/shared_preference_manager.dart';
import 'package:password_manager/pages/passwordsPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LocalAuthentication localAuthentication = LocalAuthentication();

  bool isAvailable = false;
  bool isAuthenticated = false;
  String text = 'Please Check Biometric Availability';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Password Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fingerprint_rounded,
              color: isAuthenticated
                  ? Theme.of(context).primaryColor
                  : Colors.grey[400],
              size: 50,
            ),
            SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () async {
                  isAvailable = await localAuthentication.canCheckBiometrics;
                  if (isAvailable) {
                    List type =
                        await localAuthentication.getAvailableBiometrics();
                    text = "FingerPrint Available";
                  }
                  setState(() {});
                },
                child: const Text('Check FingerPrint')),
            SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: isAvailable
                    ? () async {
                        isAuthenticated = await localAuthentication
                            // ignore: deprecated_member_use
                            .authenticateWithBiometrics(
                                localizedReason: 'Please Authentication',
                                stickyAuth: true,
                                useErrorDialogs: true);
                        if (isAuthenticated) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PasswordsPage()));
                        }
                        setState(() {});
                      }
                    : null,
                child: const Text('Unlock with FingerPrint')),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onLongPress: () {
                SharedPreferencesManager.removePassword();
              },
              child: Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
