import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth_email/main.dart';
// import 'package:firebase_auth_email/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:taskmanagementapp/main.dart';
import 'package:taskmanagementapp/utils.dart';

import '../page/forgot_password_page.dart';

class LoginWidget extends StatefulWidget {
  final Function() onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Container(
              child: Image(image: AssetImage('assets/pkey.png')),
              height: 150,
              width: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Hey There,\n Welcome Back',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Email'),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid email'
                      : null,
            ),
            SizedBox(height: 4),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 233, 215, 57),
                minimumSize: Size.fromHeight(50),
                shape: StadiumBorder(),

              ),
              icon: Icon(Icons.lock_open, size: 32),
              label: Text(
                'Sign In',
                style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w900),
              ),
              onPressed: signIn,
            ),
            SizedBox(height: 24),
            GestureDetector(
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 166, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.end,
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ForgotPasswordPage(),
              )),
            ),
            SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                text: 'No account?  ',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    text: 'Sign Up',
                    style: TextStyle(
                              color: Color.fromARGB(255, 2, 192, 255),
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                         
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}