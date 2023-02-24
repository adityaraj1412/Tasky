import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taskmanagementapp/page/verify_email_page.dart';
import 'package:taskmanagementapp/utils.dart';
import 'package:taskmanagementapp/widget/login_widget.dart';
import 'package:taskmanagementapp/page/home_page.dart';
import 'package:taskmanagementapp/page/auth.dart';
import 'package:taskmanagementapp/view_models/app_view_model.dart';
import 'package:taskmanagementapp/views/splash.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(), child: MyApp()));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static final String title = 'Setup Flutter';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'title',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Splash(),
      );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Something   went wrong'));
            } else if (snapshot.hasData) {
              return HomePage();
            } else {
              return AuthPage();
            }
          },
        ),
      );
}
