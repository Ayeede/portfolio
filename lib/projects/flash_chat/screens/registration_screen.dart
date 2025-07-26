import 'package:ayden_davis_portfolio_website/projects/flash_chat/components/rounded_button.dart';
import 'package:ayden_davis_portfolio_website/projects/flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'r_s';

  const RegistrationScreen({super.key}); // id for registration screen allow for easier route navigation.
  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool _showSpinner = false;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: SizedBox(height: 200.0, child: Image.asset('fc/logo.png')),
              ),
              SizedBox(height: 48.0),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your Email.'),
              ),
              SizedBox(height: 8.0),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your Password.'),
              ),
              SizedBox(height: 24.0),
              RoundedButton(
                color: Colors.blueAccent,
                title: 'Register',
                onPress: () async {
                  setState(() {
                    _showSpinner = true;
                  });
                  try {
                    await _auth.createUserWithEmailAndPassword(email: email!, password: password!);
                    Navigator.pushNamed(context, ChatScreen.id);
                    setState(() {
                      _showSpinner = false;
                    });
                  } catch (e) {
                    debugPrint('$e');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
