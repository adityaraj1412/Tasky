import 'package:flutter/material.dart';
import 'package:taskmanagementapp/main.dart';

//import 'package:task_manager_list/views/login_page.dart';
import 'package:taskmanagementapp/views/task_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 244, 230, 31), elevation: 0),
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 244, 230, 31),
                Color.fromARGB(255, 240, 236, 180),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Image(image: AssetImage('assets/spashscreen.png')),
          ),
          Center(
            child: Container(
                height: 170,
                width: 170,
                child: Image(image: AssetImage('assets/image/logo.png'))),
          )
        ],
      )),
    );
  }
}
