import 'package:cloud_firestore/cloud_firestore.dart';
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

bool onLastPage = false;

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 3);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
            AuthPage(),
          ],
        ),
        onLastPage
        ?
        Container(
          
          
        )
        :Container(
          
          alignment: Alignment(0, 0.8),
          child: SmoothPageIndicator(
            controller: _controller,
            count: 4,
          ),
        ),




        Container(
          alignment: Alignment(0.7, 0.8),
          child: 
          
          
          onLastPage 
            ? GestureDetector(
            onTap: () {
              _controller.jumpToPage(3);
            },
            child: Text(''),
          )
          : GestureDetector(
            onTap: () {
              _controller.jumpToPage(3);
            },
            child: Text('skip'),
          )
          

      
        )
        
      ],
    ));
  }
}
