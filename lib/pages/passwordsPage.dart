import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:password_manager/bloc/contact_bloc.dart';
import 'package:password_manager/bloc/contact_event.dart';
import 'package:password_manager/bloc/contact_state.dart';
// import 'package:password_manager/services/apiService.dart';
import 'package:password_manager/bloc/counter_bloc.dart';

import '../models/contact.dart';

class PasswordsPage extends StatelessWidget {
//   const PasswordsPage({Key? key}) : super(key: key);

//   @override
//   State<PasswordsPage> createState() => _PasswordsPageState();
// }

// class _PasswordsPageState extends State<PasswordsPage> {
//   List<dynamic> data = [];
//   @override
//   void initState() {
//     super.initState();
//     // Data();
//   }

//   Future<void> Data() async {
//     try {
//       final jsonData = await fetchData();
//       setState(() {
//         data = jsonData;
//       });
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ContactBloc(),
        child: WillPopScope(
            onWillPop: () async {
              SystemNavigator.pop();
              return false;
            },
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text('Password Manager'),
              ),
              body: Center(
                child: BlocBuilder<ContactBloc, ContactState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.contacts.length,
                      itemBuilder: (context, index) {
                        final contact = state.contacts[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Test Bloc"),
                            Text(
                              contact.name.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                            SizedBox(height: 20),
                            Text(
                              contact.phoneNumber.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    BlocProvider.of<CounterBloc>(context)
                                        .add(IncrementEvent());
                                  },
                                  child: Icon(Icons.add),
                                ),
                                SizedBox(width: 16),
                                FloatingActionButton(
                                  onPressed: () {
                                    BlocProvider.of<CounterBloc>(context)
                                        .add(DecrementEvent());
                                  },
                                  child: Icon(Icons.remove),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  final contact = Contact('John Doe', '123456789');
                  BlocProvider.of<ContactBloc>(context)
                      .add(AddContactEvent(contact));
                },
                child: Icon(Icons.add),
              ),

              //   physics: const BouncingScrollPhysics(),
              //   itemCount: data.length,
              //   itemBuilder: (context, index) {
              //     final item = data[index];
              //     return ListTile(
              //       title: Text(
              //         item['name'],
              //         style: TextStyle(color: Colors.white),
              //       ),
              //       subtitle: Text(item['color']),
              //     );
              //   },
              // ),
            )));
  }
}
