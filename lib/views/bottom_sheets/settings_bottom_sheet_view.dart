import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:taskmanagementapp/view_models/app_view_model.dart';

import '../../models/task_model.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class SettingsBottomSheetView extends StatelessWidget {
//   const SettingsBottomSheetView({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   final TextEditingController entryController = TextEditingController();


class SettingsBottomSheetView extends StatelessWidget {
  const SettingsBottomSheetView({super.key});
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;


    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 233, 215, 57),
        title: Text('Setting'),
      ),
        body: Padding(padding: EdgeInsets.all(32),
        child: Column(children: [
          Text(
            'Signed In as',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            user.email!,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                minimumSize: Size.fromHeight(40),
                shape: StadiumBorder(),
              ),
            icon: Icon(Icons.arrow_back,size:32),
            label: Text(
              'Sign Out',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () =>FirebaseAuth.instance.signOut(),
            )
        ]),),
    );
    });
  }
}