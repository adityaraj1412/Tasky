import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taskmanagementapp/introduction_screen/page1.dart';
import 'package:taskmanagementapp/introduction_screen/page2.dart';
import 'package:taskmanagementapp/introduction_screen/page3.dart';
import 'package:taskmanagementapp/page/auth.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

PageController _controller = PageController();

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.8),
          child: SmoothPageIndicator(
            controller: _controller,
            count: 3,
          ),
        ),
        Container(
          alignment: Alignment(0.7, 0.8),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => authontication()));
            },
            child: Text('skip'),
          ),
        )
      ],
    ));
  }
}

class authontication extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return AuthPage();
          },
        ),
      );
}
