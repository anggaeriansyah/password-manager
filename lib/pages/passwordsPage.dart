import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_manager/services/apiService.dart';
import 'package:password_manager/models/color_model.dart';

class PasswordsPage extends StatefulWidget {
  const PasswordsPage({Key? key}) : super(key: key);

  @override
  State<PasswordsPage> createState() => _PasswordsPageState();
}

class _PasswordsPageState extends State<PasswordsPage> {
  List<dynamic> data = [];
  @override
  void initState() {
    super.initState();
    Data();
  }

  Future<void> Data() async {
    try {
      final jsonData = await fetchData();
      setState(() {
        data = jsonData;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('List Warna'),
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return ListTile(
              title: Text(
                item['name'],
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(item['color']),
            );
          },
        ),
      ),
    );
  }
}
